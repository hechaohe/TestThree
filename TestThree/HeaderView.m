//
//  HeaderView.m
//  TestThree
//
//  Created by hc on 2018/4/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "HeaderView.h"
#import <Masonry/Masonry.h>
@interface HeaderView ()


@property (nonatomic,strong) UIButton *delegateBtn;

@end

@implementation HeaderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.customView = [[UIView alloc] init];
        self.customView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_customView];
        [self.customView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(@10);
            make.size.mas_equalTo(CGSizeMake(100, 30));
        }];
        
        
        
        self.headerLabel = [[UILabel alloc] init];
        self.headerLabel.frame = CGRectMake(20, 10, 100, 30);
        self.headerLabel.textColor = [UIColor blackColor];
        self.headerLabel.textAlignment = NSTextAlignmentCenter;
        self.headerLabel.text = @"I'm header";
        [self addSubview:_headerLabel];
        
        self.delegateBtn = [UIButton buttonWithType:0];
        self.delegateBtn.frame = CGRectMake(0, 40, 80, 30);
        [self.delegateBtn setTitle:@"Delegate" forState:UIControlStateNormal];
        self.delegateBtn.backgroundColor = [UIColor colorNamed:@"color1"];
        [self addSubview:_delegateBtn];
        [self.delegateBtn addTarget:self action:@selector(delegateBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
        self.blockBtn = [UIButton buttonWithType:0];
        self.blockBtn.frame = CGRectMake(100, 40, 80, 30);
        [self.blockBtn setTitle:@"Block" forState:UIControlStateNormal];
        self.blockBtn.backgroundColor = [UIColor colorNamed:@"color2"];
        [self addSubview:_blockBtn];
        [self.blockBtn addTarget:self action:@selector(blockBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
    
}

- (void)delegateBtnAction {
    NSLog(@"delegate");
    if ([self.delegate respondsToSelector:@selector(clickDelegateBtnWithView:)]) {
        [self.delegate clickDelegateBtnWithView:self];
    }
}

- (void)blockBtnAction {
    NSLog(@"block");
    !self.blockBtnBlock ? : self.blockBtnBlock();
}


















@end
