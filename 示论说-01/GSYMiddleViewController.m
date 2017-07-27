//
//  GSYMiddleViewController.m
//  示论说-01
//
//  Created by Song on 17/7/26.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYMiddleViewController.h"

@interface GSYMiddleViewController ()

@end

@implementation GSYMiddleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatView];
    
}

// 创建view
-(void)creatView {
    UIViewController *mainView = [[UIViewController alloc] init];
//    mainView.backgroundColor = [UIColor redColor];
//    [self.tabBarController.view addSubview:mainView];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [mainView.view addSubview:btn];
    
    
}

-(void)click {
    NSLog(@"click");
//    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    
}



@end
