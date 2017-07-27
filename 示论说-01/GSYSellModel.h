//
//  GSYSellModel.h
//  示论说-01
//
//  Created by Song on 17/7/22.
//  Copyright © 2017年 Song. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSYSellModel : NSObject

// 对应的数据
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *img1;
@property(nonatomic,copy) NSString *img2;
@property(nonatomic,copy) NSString *img3;
@property(nonatomic,copy) NSString *price;
@property(nonatomic,copy) NSString *oldPrice;
@property(nonatomic,copy) NSString *content;
@property(nonatomic,copy) NSString *phone;
@property(nonatomic,copy) NSString *like;
@property(nonatomic,copy) NSString *comment;

+(instancetype)GSYWithDict:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
