//
//  waterClickViewController.m
//  示论说-01
//
//  Created by Song on 2018/3/30.
//  Copyright © 2018年 Song. All rights reserved.
//

#import "waterClickViewController.h"
#import "UIImageView+WebCache.h"

@interface waterClickViewController ()
- (IBAction)back:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *wordText;
@property (weak, nonatomic) IBOutlet UILabel *dianzan;

@end

@implementation waterClickViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self dianzanshu];
    
    NSLog(@"waterClick - %@",self.imgURL);
    NSLog(@"waterClick - %@",self.words);
    [self setupImageView];
    [self setWordText];
}

-(void)dianzanshu {
    int y = (arc4random() % 501) + 500;
    NSString *stringInt = [NSString stringWithFormat:@"%d",y];
    self.dianzan.text = stringInt;
}

-(void)setupImageView {
    
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.imgURL] placeholderImage:[UIImage imageNamed:@"IMG_1659"]];
    UIImage *sourceImg = imageView.image;
    
    CGFloat imgx = self.view.frame.size.width / 2 - 70;
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(imgx, 100, 140, 200)];
    imageView2.image = sourceImg;
    [self.view addSubview:imageView2];
}

-(void)setWordText {
    NSString *wordStr = [self.words stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    self.wordText.text = wordStr;
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
