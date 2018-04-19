//
//  ViewController.m
//  TestThree
//
//  Created by hc on 2018/4/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "ViewController.h"
#import "HeaderView.h"
#import "AViewController.h"
#import "BViewController.h" //通知正向传值VC
#import <Masonry/Masonry.h>
@interface ViewController () <UITableViewDelegate,UITableViewDataSource,HeaderViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) HeaderView *headerView;
@property (nonatomic,strong) UIView *footerView;
@end

@implementation ViewController

static NSString *CELLID = @"CELL";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELLID];
    
    self.headerView = [[HeaderView alloc] init];
    _headerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 100);
    _headerView.delegate = self;
    
    __weak typeof (self) weakSelf = self;
    
    self.headerView.blockBtnBlock = ^{
        NSLog(@"vc block");
        weakSelf.headerView.customView.backgroundColor = [UIColor colorNamed:@"color2"];
    };
    self.tableView.tableHeaderView = _headerView;
    
    
    self.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    self.footerView.backgroundColor = [UIColor colorNamed:@"Color3"];
    self.footerView.userInteractionEnabled = YES;
    self.tableView.tableFooterView = self.footerView;
    UILabel *label1 = [[UILabel alloc] init];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.text = @"通知正向传值";
    [self.footerView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.footerView);
        make.centerY.mas_equalTo(self.footerView);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
    
    
    UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(forwardPassValue)];
    [_footerView addGestureRecognizer:tapGes];
    
    
    //反向传值 addObserver①②③
   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeName:) name:@"changeName" object:nil];
    
  
}
//反向传值 selector①②③
- (void)changeName:(NSNotification *)noti {
    
    self.headerView.headerLabel.text = [noti.userInfo objectForKey:@"name"];
    
  
}
- (void)viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:YES];

    //在页面消失的回调方法中移除通知。
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"notification"object:nil];

}

#pragma mark UITableviewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AViewController *vc = [[AViewController alloc] init];
    __weak typeof (self) weakSelf = self;
    vc.callBackBlock = ^(NSString *str) {
        weakSelf.headerView.headerLabel.text = str;
    };
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
}


#pragma mark HeaderViewDelegate

- (void)clickDelegateBtnWithView:(HeaderView *)headerView {
    
    NSLog(@"vc click");
    headerView.customView.backgroundColor = [UIColor colorNamed:@"color1"];


}



#pragma mark --Privaty

- (void)forwardPassValue {
    /*
    一个视图控制器被创建，并在屏幕上显示的时候。 代码的执行顺序
    1、 alloc                                   创建对象，分配空间
    2、init                                      初始化对象，初始化数据
    3、loadView                            加载视图
    4、viewDidLoad                      载入完成
    5、viewWillAppear                 视图将出现在屏幕
    6、viewDidAppear                 视图已在屏幕上渲染完成
    
    当一个视图被移除屏幕并且销毁的时候的执行顺序，
    1、viewWillDisappear            视图将被从屏幕上移除之
    2、viewDidDisappear            视图已经被从屏幕上移除
    3、dealloc                              视图被销毁
    */
    
    BViewController *vc = [[BViewController alloc] init];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"forwardNoti" object:self userInfo:@{@"forwardKey" : @"forwardValue"}];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}




#pragma mark --Lazy
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
