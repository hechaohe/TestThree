//
//  HeaderView.h
//  TestThree
//
//  Created by hc on 2018/4/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeaderView;

@protocol HeaderViewDelegate <NSObject>

- (void)clickDelegateBtnWithView:(HeaderView *)headerView;

@end


@interface HeaderView : UITableViewHeaderFooterView

@property (nonatomic,strong) UIView *customView;
@property (nonatomic,strong) UILabel *headerLabel;
@property (nonatomic,weak) id<HeaderViewDelegate> delegate;

@property (nonatomic,strong) UIButton *blockBtn;
@property (nonatomic,copy) void(^blockBtnBlock)(void);

@end
