//
//  GSYTableViewCellModel.m
//  示论说-01
//
//  Created by Song on 17/7/17.
//  Copyright © 2017年 Song. All rights reserved.
//

#import "GSYTableViewCellModel.h"

@implementation GSYTableViewCellModel

//+(instancetype)itemWithIcon:(NSString *)icon text:(NSString *)text details:(NSString *)details {
//    GSYTableViewCellModel *item = [[self alloc] init];
//    item.icon = icon;
//    item.text = text;
//    item.details = details;
//    return item;
//}

+(instancetype)tableWithIcon:(NSString *)icon title:(NSString *)title details:(NSString *)details vcClass:(__unsafe_unretained Class)vcClass {
    GSYTableViewCellModel *item = [[self alloc] init];
    
    item.icon = icon;
    item.text = title;
    item.details = details;
    item.vcClass = vcClass;
    
    return item;
}

@end
