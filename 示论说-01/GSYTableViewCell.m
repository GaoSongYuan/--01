//
//  GSYTableViewCell.m
//  示论说-01
//
//  Created by Song on 17/7/16.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYTableViewCell.h"
#import "GSYTableViewModel.h" // 箭头
#import "GSYTableViewCellModel.h" // 无箭头

@interface GSYTableViewCell()

@property(nonatomic,strong) UIImageView *arrow;

@end

@implementation GSYTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 缓存池
+(instancetype)cellWithTableView:(UITableView *)tableView {
    NSString *ID = @"cellcell";
    GSYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[GSYTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

// 箭头
-(UIImageView *)arrowView11 {
    if (_arrow == nil) {
        _arrow  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"CellArrow"]];
    }
    return self.arrow;
}

// 箭头
-(void)setRight {
    if ([self.model0 isKindOfClass:[GSYTableViewModel class]]) { // 箭头
        self.accessoryView = self.arrowView11;
    }else {
        self.accessoryView = nil;
    }
}

-(void)setupData {

    self.imageView.image = [UIImage imageNamed:self.model0.icon];
    self.textLabel.text = self.model0.text;
    self.detailTextLabel.text = self.model0.details;
    self.detailTextLabel.textColor = [UIColor lightGrayColor];
    

}



-(void)setModel0:(GSYTableViewModel *)model0 { 
    _model0 = model0;
    [self setRight];
    [self setupData];
}

//-(void)setModel1:(GSYTableViewModel *)model1 { // 无箭头
//    _model1 = model1;
//    [self setupData];
//}

@end
