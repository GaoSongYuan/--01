//
//  GSYSellCell.h
//  示论说-01
//
//  Created by Song on 17/7/22.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GSYSellModel;

@interface GSYSellCell : UITableViewCell

// 通过tbaleview创建cell
+(instancetype)cellWithTableView:(UITableView *)tableView;

// 模型
@property(nonatomic,strong) GSYSellModel *model;

@end
