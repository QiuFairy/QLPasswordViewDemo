//
//  QLVerificationCodeView.h
//  QLPasswordViewDemo
//
//  Created by qiu on 2019/5/30.
//  Copyright © 2019 qiu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QLVerificationCodeView : UIView
@property(nonatomic,assign)NSInteger VerificationCodeNum;//验证码位数

@property(nonatomic,assign)BOOL isSecure;//是否密文显示

@property(nonatomic,assign)CGFloat Spacing;//每个格子间距


@property (nonatomic, strong,readonly) NSString *vertificationCode;//验证码内容

@property (nonatomic, strong)UIColor *deselectColor;//未选中颜色

@property (nonatomic, strong)UIColor *selectedColor;//选中颜色

@property (nonatomic, strong)NSMutableArray *textFieldArray;//放textField的array用于在外面好取消键盘
@end

NS_ASSUME_NONNULL_END
