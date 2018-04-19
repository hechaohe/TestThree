//
//  BViewController.m
//  TestThree
//
//  Created by hc on 2018/4/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic,copy) NSString *str;
@end

@implementation BViewController

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
- (instancetype)init {
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotiValue:) name:@"forwardNoti" object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.label.text = _str;
}

- (void)getNotiValue:(NSNotification *)noti {
    NSLog(@"%@",noti.userInfo[@"forwardKey"]);
    self.str = noti.userInfo[@"forwardKey"];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
