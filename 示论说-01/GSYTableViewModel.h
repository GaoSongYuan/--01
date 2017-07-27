//
//  GSYTableViewModel.h
//  示论说-01
//
//  Created by Song on 17/7/16.
//  Copyright © 2017年 Song. All rights reserved.
//


// 带有箭头
#import <Foundation/Foundation.h>

typedef void(^GSYSettingItemOption)();

@interface GSYTableViewModel : NSObject

@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *details; // 会话详情（下方文字）
@property(nonatomic,copy) GSYSettingItemOption option; // 点击那个cell需要做什么事
@property(nonatomic,assign) Class vcClass;

+(instancetype)tableWithIcon:(NSString *)icon title:(NSString *)title details:(NSString *)details vcClass:(Class)vcClass;


@end
