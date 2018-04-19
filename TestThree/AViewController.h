//
//  AViewController.h
//  TestThree
//
//  Created by hc on 2018/4/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AViewController : UIViewController

@property (nonatomic,copy) void(^callBackBlock)(NSString *str);


@end
