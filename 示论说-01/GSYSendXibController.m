//
//  GSYSendXibController.m
//  示论说-01
//
//  Created by Song on 17/7/27.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYSendXibController.h"

@interface GSYSendXibController ()
- (IBAction)back:(id)sender;
- (IBAction)upload:(id)sender;

@end

@implementation GSYSendXibController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)upload:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
