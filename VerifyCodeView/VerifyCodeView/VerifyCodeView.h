//
//  VerifyCodeView.h
//  PasswordInputView
//
//  Created by ArcherLj on 2019/9/2.
//  Copyright © 2019 ArcherLj. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 验证码控件
 
 思路：先添加和验证码长度相对应个数的文本框，然后在文本框上覆盖输入框；输入框的文字颜色和光标颜色
    全部设为透明，这样用户只能看到文本框；通过输入框代理来设置文本框文字，给用户直接在文本框上输入
    的错觉；
 
 注意：每个验证码输入框的宽高和整个控件的高度是一样的，只要调整整个控件的高度就可以改变输入框的宽高
 */

IB_DESIGNABLE
@interface VerifyCodeView : UIView

@property (nonatomic, strong) IBInspectable UIColor *codeInputViewBackgroundColor; // 输入框背景色

@property (nonatomic, assign) IBInspectable CGFloat borderWidth; // 输入框边框宽度
@property (nonatomic, strong) IBInspectable UIColor *borderColor; // 输入框边框颜色

@property (nonatomic, strong) IBInspectable UIColor *textColor; // 验证码文字颜色
@property (nonatomic, strong) IBInspectable UIFont *textFont; // 验证码文字font

@property (nonatomic, assign) IBInspectable NSInteger codeLength; // 验证码长度

@end
