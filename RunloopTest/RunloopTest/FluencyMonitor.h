//
//  FluencyMonitor.h
//  RunloopTest
//
//  Created by 方冬冬 on 2017/10/16.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FluencyMonitor : NSObject
+ (instancetype)shareMonitor;


/**
 开始监控
 
 @param interval 定时器间隔时间
 @param fault 卡顿的阙值
 */
- (void)startWithInterval:(NSTimeInterval)interval fault:(NSTimeInterval)fault;


/**
 开始监控
 */
- (void)start;

// 停止监控
- (void)stop;
@end
