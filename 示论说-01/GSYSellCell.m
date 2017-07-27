//
//  GSYSellCell.m
//  示论说-01
//
//  Created by Song on 17/7/22.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYSellCell.h"
#import "GSYSellModel.h"

@interface GSYSellCell()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *img1;
@property (weak, nonatomic) IBOutlet UIImageView *img2;
@property (weak, nonatomic) IBOutlet UIImageView *img3;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *oldPrice;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *like;
@property (weak, nonatomic) IBOutlet UILabel *comment;


@end

@implementation GSYSellCell

+(instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"gsyID";
    GSYSellCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GSYSellCell" owner:nil options:nil] lastObject];
    }
    return cell;
}


// 重写set方法
-(void)setModel:(GSYSellModel *)model {
    _model = model;
    
    // 放置内容
    self.icon.image = [UIImage imageNamed:model.icon];
    self.name.text = model.name;
    self.img1.image = [UIImage imageNamed:model.img1];
    self.img2.image = [UIImage imageNamed:model.img2];
    self.img3.image = [UIImage imageNamed:model.img3];
    self.price.text = [NSString stringWithFormat:@"¥%@.00",model.price];
    self.price.font = [UIFont boldSystemFontOfSize:20]; // 字体加粗
    self.oldPrice.text = [NSString stringWithFormat:@"¥%@.00",model.oldPrice];
    // 删除线
    NSUInteger length = self.oldPrice.text.length;
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:self.oldPrice.text];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, length)];
    [self.oldPrice setAttributedText:attri];
    
    self.content.text = model.content;
    self.phone.text = [NSString stringWithFormat:@"电话: %@",model.phone];
    self.like.text = [NSString stringWithFormat:@"%@喜欢",model.like];
    self.comment.text = [NSString stringWithFormat:@"%@评论",model.comment];
}


@end
