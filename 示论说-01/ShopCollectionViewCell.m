//
//  ShopCollectionViewCell.m
//  WaterFlow
//
//  Created by 谢飞 on 16/2/6.
//  Copyright © 2016年 谢飞. All rights reserved.
//

#import "ShopCollectionViewCell.h"
#import "ShopModel.h"
#import "UIImageView+WebCache.h"

//#import "GSYJiaHaoController.h"
#import "ViewController.h"
#import "TestViewController1.h"

@interface ShopCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *image;
//@property (weak, nonatomic) IBOutlet UILabel *price;

//@property(nonatomic,weak) UIViewController *vcc;

- (IBAction)test:(id)sender;

//@property (weak, nonatomic) IBOutlet UIButton *BigBtn;

@end
@implementation ShopCollectionViewCell

-(void)setShop:(ShopModel *)shop {
    
    _shop = shop;
    
  
    [self.image sd_setImageWithURL:[NSURL URLWithString:shop.img] placeholderImage:[UIImage imageNamed:@"IMG_1659"]];
    
//    [self.image setImage:[UIImage imageNamed:@"right1"]];
//    [self.image setImage:[UIImage imageNamed:@"right2"]];
//    [self.image setImage:[UIImage imageNamed:@"right3"]];
//    [self.BigBtn.imageView setImage:[UIImage imageNamed:@"right1"]];
    
//    self.price.text = shop.price;
    
}



- (IBAction)test:(id)sender {
    
    NSLog(@"%@",self.shop.img);
    
    TestViewController1 *vc = [[TestViewController1 alloc] init];
    
    [self.viewCon presentViewController:vc animated:YES completion:nil];
    
}
@end
