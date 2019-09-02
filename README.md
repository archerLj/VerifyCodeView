# VerifyCodeView
一个简单的验证码输入控件，大致的效果如下：

 ![image](https://github.com/archerLj/VerifyCodeView/raw/master/images/show.png)


# 使用

直接使用CocoaPods引入即可：
```
pod "VerifyCodeView"
```

`VerifyCodeView`控件有下面几个属性，可用来自定义：
```
@property (nonatomic, strong) IBInspectable UIColor *codeInputViewBackgroundColor; // 输入框背景色

@property (nonatomic, assign) IBInspectable CGFloat borderWidth; // 输入框边框宽度
@property (nonatomic, strong) IBInspectable UIColor *borderColor; // 输入框边框颜色

@property (nonatomic, strong) IBInspectable UIColor *textColor; // 验证码文字颜色
@property (nonatomic, strong) IBInspectable UIFont *textFont; // 验证码文字font

@property (nonatomic, assign) IBInspectable NSInteger codeLength; // 验证码长度
```

同样，也可以直接在Xib中设置这些属性，`textFont`除外:
 ![image](https://github.com/archerLj/VerifyCodeView/raw/master/images/xib.png)
