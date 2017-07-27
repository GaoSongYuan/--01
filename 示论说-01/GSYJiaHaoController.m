//
//  GSYJiaHaoController.m
//  示论说-01
//
//  Created by Song on 17/7/26.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYJiaHaoController.h"

@interface GSYJiaHaoController ()
- (IBAction)backBtn:(id)sender;
- (IBAction)btn1:(id)sender;
- (IBAction)btn2:(id)sender;
- (IBAction)btn3:(id)sender;
- (IBAction)btn4:(id)sender;


@end

@implementation GSYJiaHaoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//-(void)viewDidAppear:(BOOL)animated {
//    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut  animations:^{
//        // 添加4按钮
//        [self fourBtn];
//        [self.view layoutIfNeeded];
//    } completion:nil];
//}

//// 创建四个按钮
//-(void)fourBtn {
//    // 添加四个按钮
//    for (int i = 0; i<4; i++) {
//        CGFloat y = 200;
//        CGFloat w = self.view.frame.size.width * 0.25;
//        CGFloat h = 104;
//        CGFloat x = i * w;
//        
//        UIButton *btn4 = [[UIButton alloc] initWithFrame:CGRectMake(x, y, w, h)];
//        [btn4 setBackgroundImage:[UIImage imageNamed:[NSString stringWithFormat:@"paishe%d",i+1]] forState:UIControlStateNormal];
//        [btn4 addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:btn4];
//    }
//}

-(void)click {
    NSLog(@"click - up");
}

- (IBAction)backBtn:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)btn1:(id)sender {
    NSLog(@"1");
}

- (IBAction)btn2:(id)sender {
    NSLog(@"2");
}

- (IBAction)btn3:(id)sender {
    NSLog(@"3");
}

- (IBAction)btn4:(id)sender {
    NSLog(@"4");
}
@end
