//
//  QLVerificationTextField.m
//  QLPasswordViewDemo
//
//  Created by qiu on 2019/5/30.
//  Copyright © 2019 qiu. All rights reserved.
//

#import "QLVerificationTextField.h"

@implementation QLVerificationTextField

-(void)deleteBackward{
    [super deleteBackward];
    if ([self.ql_delegate respondsToSelector:@selector(QLTextFieldDeleteBackward:)]) {
        
        [self.ql_delegate QLTextFieldDeleteBackward:self];
    }
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    
    if (action == @selector(paste:)) {
        //禁止粘贴
        return NO;
    }
    if (action == @selector(select:)) {
        //禁止选择
        return NO;
    }
    if (action == @selector(selectAll:)) {
        //禁止全选
        return NO;
    }
    return[super canPerformAction:action withSender:sender];
}
@end
