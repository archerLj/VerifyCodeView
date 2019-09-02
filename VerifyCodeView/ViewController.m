//
//  ViewController.m
//  PasswordInputView
//
//  Created by ArcherLj on 2019/9/2.
//  Copyright © 2019 ArcherLj. All rights reserved.
//

#import "ViewController.h"
#import "VerifyCodeView.h"

@interface ViewController ()
@property (nonatomic, strong) VerifyCodeView *verifyCodeView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.verifyCodeView];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.verifyCodeView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [NSLayoutConstraint activateConstraints:@[
                                              [self.verifyCodeView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:200],
                                              [self.verifyCodeView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:50],
                                              [self.verifyCodeView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-50],
                                              [self.verifyCodeView.heightAnchor constraintEqualToConstant:50.0]
                                              ]];
}


/******************************************************************/
#pragma mark - setter
/******************************************************************/
-(VerifyCodeView *)verifyCodeView {
    if (_verifyCodeView == nil) {
        _verifyCodeView = [[VerifyCodeView alloc] init];
//        _verifyCodeView.codeInputViewBackgroundColor = [UIColor lightGrayColor];
//        _verifyCodeView.borderWidth = 8.0;
//        _verifyCodeView.borderColor = [UIColor greenColor];
//        _verifyCodeView.textColor = [UIColor redColor];
//        _verifyCodeView.textFont = [UIFont systemFontOfSize:20.0];
        _verifyCodeView.codeLength = 4;
    }
    return _verifyCodeView;
}
@end
