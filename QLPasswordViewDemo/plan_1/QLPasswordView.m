//
//  QLPasswordView.m
//  QLPasswordViewDemo
//
//  Created by qiu on 2019/5/30.
//  Copyright © 2019 qiu. All rights reserved.
//

#import "QLPasswordView.h"

@interface QLPasswordView ()

@property (nonatomic, strong)NSMutableArray *labelMArr;

@property (nonatomic, strong)UITextField *numTextField;

@end

@implementation QLPasswordView

- (instancetype)initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame labelNum:0];
}

- (instancetype)initWithFrame:(CGRect)frame labelNum:(NSInteger)num{
    self = [super initWithFrame:frame];
    if (self) {
        self.secureLabelTextEntry = YES;
        _labelNum = num;
        [self addSubview:self.numTextField];
        for (int i = 0; i < num; i++) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((self.frame.size.width/num) *i, 0, self.frame.size.width / num, self.frame.size.height)];
            label.backgroundColor = [UIColor whiteColor];
            [self.labelMArr addObject:label];
            label.textAlignment = NSTextAlignmentCenter;
#pragma mark 此处修改label样式
            label.layer.borderWidth = 1;
            label.layer.cornerRadius = 7;
            label.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTouch:)];
            [label addGestureRecognizer:tap];
            [self addSubview:label];
        }
    }
    return self;
}

- (void)labelTouch:(UIGestureRecognizer *)tap{
    [self.numTextField becomeFirstResponder];
}

- (void)textFieldChange:(id)sender{
    for (int i = 0; i < self.labelMArr.count; i++) {
        UILabel *label = self.labelMArr[i];
        if (i < self.numTextField.text.length) {
            if (!self.secureLabelTextEntry) {
                label.text = [NSString stringWithFormat:@"%c", [self.numTextField.text characterAtIndex:i]];
            } else {
                
                //偷懒下
                label.text = @"●";
            }
        } else {
            label.text = @"";
        }
    }
    if (self.numTextField.text.length >= self.labelNum) {
        self.numTextField.text = [self.numTextField.text substringToIndex:self.labelNum];
        if (self.pswBlock) {
            self.pswBlock(self.numTextField.text);
        }
    }
}

- (UITextField *)numTextField{
    if (!_numTextField) {
        _numTextField = [[UITextField alloc]initWithFrame:self.bounds];
        _numTextField.keyboardType = UIKeyboardTypeNumberPad;
        [_numTextField addTarget:self action:@selector(textFieldChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _numTextField;
}

- (NSMutableArray *)labelMArr{
    if (!_labelMArr) {
        _labelMArr = [NSMutableArray array];
    }
    return _labelMArr;
}

@end
