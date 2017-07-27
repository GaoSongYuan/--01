//
//  GSYTableViewCellModel.h
//  示论说-01
//
//  Created by Song on 17/7/17.
//  Copyright © 2017年 Song. All rights reserved.
//


// 无箭头


#import <Foundation/Foundation.h>

typedef void(^GSYSettingItemOption)();

@interface GSYTableViewCellModel : NSObject

@property(nonatomic,copy) NSString *icon; // 图标
@property(nonatomic,copy) NSString *text; // 会话人名字
@property(nonatomic,copy) NSString *details; // 会话详情（下方文字）
@property(nonatomic,copy) GSYSettingItemOption option; // 点击那个cell需要做什么事
@property(nonatomic,assign) Class vcClass;

//@property(nonatomic,assign) Class destVcClass; // 即将需要跳转的控制器, 点击这行cell 需要跳转的控制器

+(instancetype)tableWithIcon:(NSString *)icon title:(NSString *)title details:(NSString *)details vcClass:(Class)vcClass;

// (__unsafe_unretained Class)
@end
