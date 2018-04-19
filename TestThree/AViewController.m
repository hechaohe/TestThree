//
//  AViewController.m
//  TestThree
//
//  Created by hc on 2018/4/19.
//  Copyright © 2018年 ios. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *notiTextField;

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
}

- (IBAction)confirm:(UIButton *)sender {
    
    !self.callBackBlock ? : self.callBackBlock(self.textField.text);
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)confirmNoti:(UIButton *)sender {
    //反向传值 postNotification ①②③
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changeName" object:self userInfo:@{@"name":self.notiTextField.text}];
    [self.navigationController popViewControllerAnimated:YES];
}








@end
