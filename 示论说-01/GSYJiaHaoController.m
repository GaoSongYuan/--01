//
//  GSYJiaHaoController.m
//  示论说-01
//
//  Created by Song on 17/7/26.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYJiaHaoController.h"
#import "TestViewController1.h"
#import "GSYSendXibController.h"

@interface GSYJiaHaoController ()
- (IBAction)backBtn:(id)sender;
- (IBAction)btn1:(id)sender;
- (IBAction)btn2:(id)sender;
- (IBAction)btn3:(id)sender;
- (IBAction)btn4:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;

@property (weak, nonatomic) IBOutlet UILabel *ri;
@property (weak, nonatomic) IBOutlet UILabel *nian;
@property (weak, nonatomic) IBOutlet UILabel *yue;
@property (weak, nonatomic) IBOutlet UILabel *xingqi;

@end

@implementation GSYJiaHaoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.btn1.frame = CGRectMake(0, 800, 103.67, 104);
    self.btn2.frame = CGRectMake(0, 800, 103.67, 104);
    self.btn3.frame = CGRectMake(0, 800, 103.67, 104);
    self.btn4.frame = CGRectMake(0, 800, 103.67, 104);
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    // 添加时间
    [self nowTime];
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [UIView animateWithDuration:1.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:0.8 options:UIViewAnimationOptionCurveEaseOut  animations:^{
        
        // 添加按钮
        self.btn1.frame = CGRectMake(0, 530, 103.67, 104);
        self.btn2.frame = CGRectMake(103.67, 530, 103.67, 104);
        self.btn3.frame = CGRectMake(207.33, 530, 103.67, 104);
        self.btn4.frame = CGRectMake(311, 530, 103.67, 104);
        
    } completion:nil];
}

// 获取当前日期时间
-(void)nowTime {
//    NSDate *date = [NSDate date];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterMediumStyle];
//    [formatter setTimeStyle:NSDateFormatterShortStyle];
//    [formatter setDateFormat:@"YYYY-MM-dd-EEEE"];
//    NSString *DateTime = [formatter stringFromDate:date];
//    NSLog(@"=================== %@ ====================",DateTime);
    
    NSDate *nian1 = [NSDate date];
    NSDateFormatter *nian = [[NSDateFormatter alloc] init];
    [nian setDateStyle:NSDateFormatterMediumStyle];
    [nian setTimeStyle:NSDateFormatterShortStyle];
    [nian setDateFormat:@"YYYY"];
    NSString *nian2 = [nian stringFromDate:nian1];
    self.nian.text = [NSString stringWithFormat:@"/%@",nian2];
    NSLog(@"=================== %@ ====================",nian2);
    
    NSDate *yue1 = [NSDate date];
    NSDateFormatter *yue = [[NSDateFormatter alloc] init];
    [yue setDateStyle:NSDateFormatterMediumStyle];
    [yue setTimeStyle:NSDateFormatterShortStyle];
    [yue setDateFormat:@"MM"];
    NSString *yue2 = [yue stringFromDate:yue1];
    self.yue.text = yue2;
    NSLog(@"=================== %@ ====================",yue2);
    
    NSDate *ri1 = [NSDate date];
    NSDateFormatter *ri = [[NSDateFormatter alloc] init];
    [ri setDateStyle:NSDateFormatterMediumStyle];
    [ri setTimeStyle:NSDateFormatterShortStyle];
    [ri setDateFormat:@"dd"];
    NSString *ri2 = [ri stringFromDate:ri1];
    self.ri.text = ri2;
    NSLog(@"=================== %@ ====================",ri2);
    
    NSDate *xingqi1 = [NSDate date];
    NSDateFormatter *xingqi = [[NSDateFormatter alloc] init];
    [xingqi setDateStyle:NSDateFormatterMediumStyle];
    [xingqi setTimeStyle:NSDateFormatterShortStyle];
    [xingqi setDateFormat:@"EEEE"];
    NSString *xingqi2 = [xingqi stringFromDate:xingqi1];
    self.xingqi.text = xingqi2;
    NSLog(@"=================== %@ ====================",xingqi2);
    
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
    NSLog(@"文字");
    GSYSendXibController *vc = [[GSYSendXibController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)btn2:(id)sender {
    NSLog(@"相册");
//    TestViewController1 *vc = [[TestViewController1 alloc] init];
//    [self presentViewController:vc animated:YES completion:nil]; // 用TestViewController1 中的 back 返回即可
}

- (IBAction)btn3:(id)sender {
    NSLog(@"拍摄");
//    TestViewController1 *vc = [[TestViewController1 alloc] init];
//    [self presentViewController:vc animated:YES completion:nil]; // 用TestViewController1 中的 back 返回即可
}

- (IBAction)btn4:(id)sender {
    NSLog(@"签到");
//    TestViewController1 *vc = [[TestViewController1 alloc] init];
//    [self presentViewController:vc animated:YES completion:nil]; // 用TestViewController1 中的 back 返回即可
}

@end
