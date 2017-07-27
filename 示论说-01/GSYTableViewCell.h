//
//  GSYTableViewCell.h
//  示论说-01
//
//  Created by Song on 17/7/16.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GSYTableViewModel; // 有箭头
//@class GSYTableViewCellModel; // 无箭头

@interface GSYTableViewCell : UITableViewCell

@property(nonatomic,strong) GSYTableViewModel *model0;
//@property(nonatomic,strong) GSYTableViewCellModel *model1; // wu箭头

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
