//
//  ExampleTwoViewController.m
//  RunloopTest
//
//  Created by 方冬冬 on 2017/10/13.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ExampleTwoViewController.h"

@interface ExampleTwoViewController ()
@property(nonatomic,assign)NSInteger count;

@end

@implementation ExampleTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //定时器写法一
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
     //定时器写法二  两种写法等价
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];

}

- (void)timerUpdate{
    
    
    
}

@end
