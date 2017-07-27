//
//  GSYRegisterController.m
//  示论说-01
//
//  Created by Song on 17/7/25.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYRegisterController.h"

@interface GSYRegisterController ()

@property (weak, nonatomic) IBOutlet UITextField *school;
@property (weak, nonatomic) IBOutlet UITextField *stuNum;
@property (weak, nonatomic) IBOutlet UITextField *phoneNum;
@property (weak, nonatomic) IBOutlet UITextField *pwd;
@property (weak, nonatomic) IBOutlet UIButton *zhuce;

@end

@implementation GSYRegisterController

- (IBAction)register:(id)sender {
    
    NSLog(@"zhucezhuce --- ");
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.school];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.stuNum];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.phoneNum];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:self.pwd];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)textChange {
    self.zhuce.enabled = (self.school.text.length && self.stuNum.text.length && self.phoneNum.text.length && self.pwd.text.length);
}
@end
