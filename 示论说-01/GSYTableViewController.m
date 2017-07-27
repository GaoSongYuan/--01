//
//  GSYTableViewController.m
//  示论说-01
//
//  Created by Song on 17/7/16.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYTableViewController.h"
#import "GSYTableViewModel.h" // 带有箭头的cell
#import "GSYTableViewCell.h"
#import "MJRefresh.h"
#import "GSYTableViewCellModel.h" // 无箭头的cell

#import "GSYTabBarController.h"

#import "TestViewController1.h"

@interface GSYTableViewController ()

@property(nonatomic,strong) NSMutableArray *data;
//@property (nonatomic, weak) UITableView *tableView;

@end

@implementation GSYTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.标题
//    self.title = @"消  息";
    
    // 多余线 消失
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // 下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];

}

-(void)refresh {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.header endRefreshing];
    });
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section{
    
    UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)view;
    
    footer.contentView.backgroundColor = [UIColor colorWithRed:237/255.0 green:241/255.0 blue:250/255.0 alpha:1.0];
    
}



-(instancetype)init {
    return [super initWithStyle:UITableViewStylePlain];
}
-(instancetype)initWithStyle:(UITableViewStyle)style {
    return [super initWithStyle:UITableViewStylePlain];
}

-(NSArray *)data {
    if (_data == nil) {
        _data = [NSMutableArray array];
        
        GSYTableViewModel *item00 = [GSYTableViewModel tableWithIcon:@"dianping" title:@"作品点评" details:nil vcClass:[TestViewController1 class]];  // 有箭头
        GSYTableViewModel *item01 = [GSYTableViewModel tableWithIcon:@"xihuanzan" title:@"喜欢和赞" details:nil vcClass:[TestViewController1 class]];
//        NSArray *group0 = @[item00,item01];
        
//        GSYTableViewModel *item10 = [GSYTableViewModel tableWithIcon:@"IDInfo" title:@"111" vcClass:nil];
//        GSYTableViewModel *item11 = [GSYTableViewModel tableWithIcon:@"IDInfo" title:@"111" vcClass:nil];

        GSYTableViewCellModel *item10 = [GSYTableViewCellModel tableWithIcon:@"970309_" title:@"970329_" details:@"你画的画真好看！" vcClass:[TestViewController1 class]]; // 无箭头
        GSYTableViewCellModel *item11 = [GSYTableViewCellModel tableWithIcon:@"970310_" title:@"970328_" details:@"请问iOS抖动动画是怎么实现的呢？" vcClass:[TestViewController1 class]];
        GSYTableViewCellModel *item12 = [GSYTableViewCellModel tableWithIcon:@"970308_" title:@"970328_" details:@"请问JSP数据传递是怎么实现的呢？" vcClass:[TestViewController1 class]];
        NSArray *group1 = @[item00,item01,item10,item11,item12];
        
//        [_data addObject:group0];
        [_data addObject:group1];
    }
    return _data;
}

///**
// *  设置刷新
// */
//- (void)setupRefresh
//{
//    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(test)];
//    [self.tableView.header beginRefreshing];
//    
//    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(test)];
//    self.tableView.footer.hidden = YES;
//}
//
//-(void)test {
//    
//}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sec = self.data[section];
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return sec.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 创建cell
    GSYTableViewCell *cell = [GSYTableViewCell cellWithTableView:tableView];
    
    // 设置cell的数据
    GSYTableViewModel *modell = self.data[indexPath.section][indexPath.row];
    cell.model0 = modell;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

// 选中cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 跳转
    GSYTableViewModel *item1 = self.data[indexPath.section][indexPath.row]; // 有箭头
    
    if (item1.option != nil) { // block有值（点击这个cell 有特定的操作需要执行）
        item1.option();
    }else if([item1 isKindOfClass:[GSYTableViewCellModel class]]) { // 无箭头
        GSYTableViewCellModel *arrowItem = (GSYTableViewCellModel *)item1;
        
        // 如果没有需要跳转的控制器
        if (arrowItem.vcClass == nil) return;
        
        UIViewController *vc = [[arrowItem.vcClass alloc] init];
        vc.title = arrowItem.text;
        GSYTabBarController *vcc = (GSYTabBarController *)self.tabBarController;
        vcc.myTabBar.hidden = YES;
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else if([item1 isKindOfClass:[GSYTableViewModel class]]) { // 有箭头
        GSYTableViewModel *arrowItem = (GSYTableViewModel *)item1;
        
        // 如果没有需要跳转的控制器
        if (arrowItem.vcClass == nil) return;
        
        UIViewController *vc = [[arrowItem.vcClass alloc] init];
        vc.title = arrowItem.text;
        GSYTabBarController *vcc = (GSYTabBarController *)self.tabBarController;
        vcc.myTabBar.hidden = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    GSYTabBarController *vcc = (GSYTabBarController *)self.tabBarController;
    vcc.myTabBar.hidden = NO;
}

//// 选中cell 跳转
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    GSYTableViewModel *modd = self.data[indexPath.section][indexPath.row];
//    UIViewController *vc = [[modd.vcClass alloc] init];
//    vc.title = modd.text;
//    [self.navigationController pushViewController:vc animated:YES];
//}
@end
