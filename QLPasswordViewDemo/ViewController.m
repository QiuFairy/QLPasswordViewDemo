//
//  ViewController.m
//  QLPasswordViewDemo
//
//  Created by qiu on 2019/5/30.
//  Copyright © 2019 qiu. All rights reserved.
//

/*!
 此项目实现类似于支付宝支付密码输入的形式
 具体实现方式请查看Note文件
 */
#import "ViewController.h"

//plan_1
#import "QLPasswordView.h"

//plan_2
#import "QLVerificationCodeView.h"

//plan_3
#import "QLPasswordTextField.h"
@interface ViewController ()

@end

#define SWidth self.view.frame.size.width

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //1
    QLPasswordView *pswView = [[QLPasswordView alloc]initWithFrame:CGRectMake(10, 100, SWidth -20, 60) labelNum:6];
    pswView.secureLabelTextEntry = NO;
    pswView.pswBlock = ^(NSString *password) {
        NSLog(@"%@", password);
    };
    [self.view addSubview:pswView];
    
    
    //2
    QLVerificationCodeView *verifiView = [[QLVerificationCodeView alloc]initWithFrame:CGRectMake(10, 200, SWidth-20, 60)];
    verifiView.selectedColor = [UIColor blackColor];
    //    _pzxView.center = self.view.center;
    //    _pzxView.deselectColor = [UIColor cyanColor];
    verifiView.VerificationCodeNum = 6;
    //    _pzxView.isSecure = YES;
    verifiView.Spacing = 0;//每个格子间距属性
    [self.view addSubview:verifiView];
    
    
    //3
    UIColor *color = [UIColor colorWithRed:236/255.0 green:95/255.0 blue:103/255.0 alpha:1.0];
    // Do any additional setup after loading the view, typically from a nib.
    QLPasswordTextField *passView = [[QLPasswordTextField alloc] initWithFrame:CGRectMake(10, 300, SWidth-20, 60)];
    // _password.secureTextEntry = NO;
    passView.septaLineWidth = 3;
    passView.septaLineColor = color;
    passView.dotFillColor = color;
    passView.dotRadius = 10;
    passView.secureTextEntry = NO;
    [self.view addSubview:passView];
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:NO];
}

@end
