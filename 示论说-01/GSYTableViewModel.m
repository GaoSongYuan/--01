//
//  GSYTableViewModel.m
//  示论说-01
//
//  Created by Song on 17/7/16.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYTableViewModel.h"

@implementation GSYTableViewModel

//+(instancetype)tableWithIcon:(NSString *)icon title:(NSString *)title vcClass:(Class)vcClass {
//    GSYTableViewModel *item = [[self alloc] init];
//    
//    item.icon = icon;
//    item.text = title;
//    item.vcClass = vcClass;
//    
//    return item;
//    
//}

+(instancetype)tableWithIcon:(NSString *)icon title:(NSString *)title details:(NSString *)details vcClass:(__unsafe_unretained Class)vcClass {
    GSYTableViewModel *item = [[self alloc] init];
    
    item.icon = icon;
    item.text = title;
    item.details = details;
    item.vcClass = vcClass;
    
    return item;
}

@end
