//
//  GSYSellModel.m
//  示论说-01
//
//  Created by Song on 17/7/22.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYSellModel.h"

@implementation GSYSellModel

+(instancetype)GSYWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self == [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
