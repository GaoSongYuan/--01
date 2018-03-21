//
//  GSYSellController.m
//  示论说-01
//
//  Created by Song on 17/7/22.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYSellController.h"
#import "GSYSellModel.h"
#import "GSYSellCell.h"
#import "MJRefresh.h"
#import "MJExtension.h"

@interface GSYSellController ()
@property(nonatomic,strong) NSMutableArray *sells;
@end

@implementation GSYSellController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.rowHeight = 417;
    
    // 下拉刷新
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refresh)];
    
    // 上拉加载
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(moreRefresh)];
}

-(void)refresh {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView.header endRefreshing];
    });
}

-(void)moreRefresh {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSArray *sells = [GSYSellModel objectArrayWithFilename:@"sell.plist"];
        [self.sells addObjectsFromArray:sells];
        
        [self.tableView reloadData];
        [self.tableView.footer endRefreshing];
    });
}

// 懒加载
-(NSMutableArray *)sells {
    if (_sells == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"sell.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            GSYSellModel *model = [GSYSellModel GSYWithDict:dict];
            [tempArray addObject:model];
        }
        _sells = tempArray;
    }
    return _sells;
}

#pragma mark - 设置数据源
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.sells.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //创建cell
    GSYSellCell *cell = [GSYSellCell cellWithTableView:tableView];
    
    // 给cell传递模型
    cell.model = self.sells[indexPath.row];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone; // 点击效果消失
    
    // 返回cell
    return cell;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];
//}

//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//}

@end
