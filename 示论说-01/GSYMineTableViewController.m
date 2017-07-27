//
//  GSYMineTableViewController.m
//  示论说-01
//
//  Created by Song on 17/7/21.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYMineTableViewController.h"
#import "MJRefresh.h"
#import "TestViewController1.h"
#import "GSYTabBarController.h"

@interface GSYMineTableViewController ()

@end

@implementation GSYMineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
}

-(void)refresh {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.header endRefreshing];
    });
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

// 选中cell 跳转

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    NSLog(@"%ld",(long)indexPath.section);
//    NSLog(@"%ld",(long)indexPath.row);
    
    if (indexPath.section == 0) { // user
        NSLog(@"第一组第一行");
        [self test];
    }
    if (indexPath.section == 1 && indexPath.row == 0) { // 我的作品
        NSLog(@" 1 ---- 0 ");
        [self test];
    }
    if (indexPath.section == 1 && indexPath.row == 1) { // 我的收藏
        NSLog(@" 1 ---- 1 ");
        [self test];
    }
    if (indexPath.section == 2 && indexPath.row == 0) { // 检查最新版本
        NSLog(@" 2 ---- 0 ");
        [self alertNew];
    }
    if (indexPath.section == 2 && indexPath.row == 1) { // 分享
        NSLog(@" 2 ---- 1 ");
        [self test];
    }
    if (indexPath.section == 2 && indexPath.row == 2) { // 意见反馈
        NSLog(@" 2 ---- 2 ");
        [self test];
    }
    if (indexPath.section == 2 && indexPath.row == 3) { // 关于
        NSLog(@" 2 ---- 3 ");
        [self test];
    }
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    GSYTabBarController *vcc = (GSYTabBarController *)self.tabBarController;
    vcc.myTabBar.hidden = NO;
}

// 检查最新版本
-(void)alertNew {
    // 初始化
    UIAlertController *alertDialog = [UIAlertController alertControllerWithTitle:nil message:@"已经是最新版本" preferredStyle:UIAlertControllerStyleAlert];
    // 创建操作
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        // 操作具体内容
        // Nothing to do.
    }];
    // 添加操作
    [alertDialog addAction:okAction];
    // 呈现警告视图
    [self presentViewController:alertDialog animated:YES completion:nil];
}

-(void)test {
    UIViewController *vc = [[TestViewController1 alloc] init];
    vc.title = @"用户信息";
    GSYTabBarController *vcc = (GSYTabBarController *)self.tabBarController;
    vcc.myTabBar.hidden = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
