//
//  QLPasswordView.h
//  QLPasswordViewDemo
//
//  Created by qiu on 2019/5/30.
//  Copyright © 2019 qiu. All rights reserved.
//

#import <UIKit/UIKit.h>

//block回调
typedef void(^PSWBlock)(NSString *password);

@interface QLPasswordView : UIView

- (instancetype)initWithFrame:(CGRect)frame labelNum:(NSInteger)num;

/*!
   是否显示密码内容，默认YES
 */
@property (nonatomic, assign)BOOL secureLabelTextEntry;
/*!
   单元格的数量
 */
@property (nonatomic, assign, readonly)NSInteger labelNum;

@property (nonatomic, copy)PSWBlock pswBlock;

@end

