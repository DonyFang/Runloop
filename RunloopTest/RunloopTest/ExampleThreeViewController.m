//
//  ExampleThreeViewController.m
//  RunloopTest
//
//  Created by 方冬冬 on 2017/10/16.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ExampleThreeViewController.h"

@interface ExampleThreeViewController ()

@end

@implementation ExampleThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    @autoreleasepool {
        NSRunLoop * runLoop = [NSRunLoop currentRunLoop];
        NSTimer * udpateTimer = [NSTimer timerWithTimeInterval:30
                                                        target:self
                                                      selector:@selector(onTimerFired)
                                                      userInfo:nil
                                                       repeats:YES];
        [runLoop addTimer:udpateTimer forMode:NSRunLoopCommonModes];
        [runLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:60*30]];
    }
}

- (void)onTimerFired{
    
    
        
}

@end
