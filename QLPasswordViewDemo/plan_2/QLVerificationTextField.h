//
//  QLVerificationTextField.h
//  QLPasswordViewDemo
//
//  Created by qiu on 2019/5/30.
//  Copyright © 2019 qiu. All rights reserved.
//

#import <UIKit/UIKit.h>


@class QLVerificationTextField;

@protocol QLTextFieldDelegate <NSObject>

- (void)QLTextFieldDeleteBackward:(QLVerificationTextField *)textField;

@end

@interface QLVerificationTextField : UITextField

@property (nonatomic, assign)id<QLTextFieldDelegate> ql_delegate;

@end
