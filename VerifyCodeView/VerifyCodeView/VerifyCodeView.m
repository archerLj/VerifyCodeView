//
//  VerifyCodeView.m
//  PasswordInputView
//
//  Created by ArcherLj on 2019/9/2.
//  Copyright © 2019 ArcherLj. All rights reserved.
//

#import "VerifyCodeView.h"

@interface VerifyCodeView() <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *mainField; // 用来输入的输入框
@property (nonatomic, strong) NSMutableArray<UITextView *> *codeViewArr; // 存储所有的验证码文本框控件
@property (nonatomic, assign) NSInteger currentCodeInputLength; // 当前输入验证码的长度

@end

@implementation VerifyCodeView

-(void)awakeFromNib {
    [super awakeFromNib];
    
    if (_codeInputViewBackgroundColor == nil) {
        _codeInputViewBackgroundColor = [UIColor whiteColor];
    }
    
    if (_borderWidth == 0) {
        _borderWidth = 2.0;
    }
    
    if (_borderColor == nil) {
        _borderColor = [UIColor blackColor];
    }
    
    if (_textColor == nil) {
        _textColor = [UIColor blackColor];
    }
    
    if (_textFont == nil) {
        _textFont = [UIFont systemFontOfSize:15.0];
    }
    
    if (_codeLength == 0) {
        _codeLength = 6;
    }
}

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        // 设置属性默认值
        _codeInputViewBackgroundColor = [UIColor whiteColor];
        _borderWidth = 2.0;
        _borderColor = [UIColor blackColor];
        _textColor = [UIColor blackColor];
        _textFont = [UIFont systemFontOfSize:15.0];
        _codeLength = 6;
    }
    return self;
}

-(void)willMoveToWindow:(UIWindow *)newWindow {
    
    [self.codeViewArr makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.codeViewArr removeAllObjects];
    
    [self initSubViews];
}

-(void)initSubViews {
    
    // 添加对应个数的文本控件
    for (NSInteger i=0; i<self.codeLength; i++) {
        
        UITextView *codeView = [[UITextView alloc] init];
        codeView.backgroundColor = self.codeInputViewBackgroundColor;
        codeView.textAlignment = NSTextAlignmentCenter;
        codeView.layer.borderWidth = self.borderWidth;
        codeView.layer.borderColor = self.borderColor.CGColor;
        codeView.textColor = self.textColor;
        codeView.font = self.textFont;
        
        [self addSubview:codeView];
        [self.codeViewArr addObject:codeView];
    }
    
    [self addSubview:self.mainField];
}

-(void)layoutSubviews {
    [super layoutSubviews];
    
    // 计算文本控件之间的间隔
    CGFloat itemWH = self.bounds.size.height;
    CGFloat itemgGap = (self.bounds.size.width - itemWH * self.codeLength) / (self.codeLength - 1);
    
    // 设置文本控件 frame
    for (NSInteger i=0; i<self.codeViewArr.count; i++) {
        CGFloat x = (itemWH + itemgGap) * i;
        UITextView *currentCodeView = self.codeViewArr[i];
        currentCodeView.frame = CGRectMake(x, 0, itemWH, itemWH);
        
        // 使文字垂直居中
        currentCodeView.text = @"0";
        CGFloat offSetY = (currentCodeView.bounds.size.height - currentCodeView.contentSize.height)/2;
        [currentCodeView setContentInset:UIEdgeInsetsMake(offSetY, 0, 0, 0)];
        currentCodeView.text = nil;
    }
    
    self.mainField.frame = self.bounds;
}

/******************************************************************/
#pragma mark - UITextFieldDelegate
/******************************************************************/
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (string.length > 0) { // 输入
        self.currentCodeInputLength ++;
        self.codeViewArr[self.currentCodeInputLength - 1].text = string;
        
        // 如果输入字符长度等于验证码长度了就讲键盘退下
        // 注意，这里键盘退下后并不会将字符自动拼接，所以一定要把这次输入的字符手动拼接到textField的text里
        if (self.currentCodeInputLength == self.codeLength) {
            textField.text = [NSString stringWithFormat:@"%@%@", textField.text, string];
            [textField resignFirstResponder];
        }
        
    } else { // 删除
        self.codeViewArr[self.currentCodeInputLength - 1].text = nil;
        self.currentCodeInputLength --;
    }
    return YES;
}


/******************************************************************/
#pragma mark - setter
/******************************************************************/
-(NSMutableArray<UITextView *> *)codeViewArr {
    if (_codeViewArr == nil) {
        _codeViewArr = [NSMutableArray array];
    }
    return _codeViewArr;
}

// 这里将输入框的文字颜色以及光标颜色设为透明，这样在用户看来，只能看到验证码文本框
-(UITextField *)mainField {
    if (_mainField == nil) {
        _mainField = [[UITextField alloc] init];
        _mainField.textColor = [UIColor clearColor];
        _mainField.delegate = self;
        _mainField.tintColor = [UIColor clearColor];
        _mainField.keyboardType = UIKeyboardTypeNumberPad;
    }
    return _mainField;
}
@end
