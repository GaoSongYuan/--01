//
//  GSYLoginController.m
//  示论说-01
//
//  Created by Song on 17/7/25.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYLoginController.h"

@interface GSYLoginController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *pwd;

@end

@implementation GSYLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneNum];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwd];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)textChange {
    self.loginBtn.enabled = (self.phoneNum.text.length && self.pwd.text.length);
}

@end
