//
//  GSYTabBarController.m
//  示论说-01
//
//  Created by Song on 17/7/16.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYTabBarController.h"
#import "GSYTabBarView.h"
#import "GSYTabBarButton.h"
//#import "GSYSendViewController.h"
#import "GSYJiaHaoController.h"

@interface GSYTabBarController ()
// 记录当前按钮的点击
@property(nonatomic ,weak) UIButton *selectedButton;
@property(nonatomic,weak) UIViewController *vcc;
@end

@implementation GSYTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tabBar removeFromSuperview];
    GSYTabBarView *myTabBar = [[GSYTabBarView alloc] init];
    myTabBar.frame = self.tabBar.frame;
    myTabBar.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myTabBar];
    self.myTabBar = myTabBar;
    
    // 放按钮图片
    for (int i = 0; i<4; i++) {

        GSYTabBarButton *btn = [[GSYTabBarButton alloc] init];

        btn.tag = i;
        
        int a = i;
        if (i==2 || i==3) {
            a = a+1;
        }
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"TabBar%d",a+1]] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"TabBar%dSel",a+1]] forState:UIControlStateSelected];
        
        // frame:
        CGFloat y = 0;
        CGFloat h = myTabBar.frame.size.height;
        CGFloat w = myTabBar.frame.size.width * 0.2;
        CGFloat x = a * w;
        btn.frame = CGRectMake(x, y, w, h);
        
        [myTabBar addSubview:btn];
        
            // 监听其余点击
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];

        // 默认点击第一个
        if(i == 0) {
            [self buttonClick:btn];
        }
    }
    [self creatBtn];
}

// 创建发信息按钮
-(void)creatBtn {
    GSYTabBarButton *btn = [[GSYTabBarButton alloc] init];
    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"TabBarsend"]] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"TabBarsendSel"]] forState:UIControlStateSelected];
    
    CGFloat y = 0;
    CGFloat h = self.myTabBar.frame.size.height;
    CGFloat w = self.myTabBar.frame.size.width * 0.2;
    CGFloat x = 2 * w;
    btn.frame = CGRectMake(x, y, w, h);
    // 监听点击发信息的按钮
    [btn addTarget:self action:@selector(write) forControlEvents:UIControlEventTouchDown];
    [self.myTabBar addSubview:btn];
}

// 监听按钮点击
-(void)buttonClick:(UIButton *)button {
    
    // 1.让当前选中的按钮取消选中
    self.selectedButton.selected = NO;
    
    // 2.让新点击的按钮选中
    button.selected = YES;
    
    // 3.新点击的按钮就成了当前选中的按钮
    self.selectedButton = button;
    
    // 根据tag 切换
    self.selectedIndex = button.tag;
}

// 点击发信息的按钮{
-(void)write {
    GSYJiaHaoController *vc = [[GSYJiaHaoController alloc] init];
    self.vcc = vc;
    [self presentViewController:vc animated:YES completion:nil];
}
@end
