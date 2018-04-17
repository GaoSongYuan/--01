//
//  TestViewController1.m
//  示论说-01
//
//  Created by Song on 17/7/25.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "TestViewController1.h"
#import "UIImageView+WebCache.h"

@interface TestViewController1 ()
- (IBAction)testClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation TestViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.img sd_setImageWithURL:[NSURL URLWithString:self.imgURL] placeholderImage:[UIImage imageNamed:@"IMG_1659"]];
}


-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.textLabel.frame = CGRectMake(0, 800, 294, 119);
}


-(void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut  animations:^{
        // 添加发布按钮
        self.textLabel.frame = CGRectMake(66, 584, 294, 119);
        
    } completion:nil];
}

- (IBAction)testClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
