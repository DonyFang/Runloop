//
//  ExamplTwoViewControllerViewController.m
//  RunloopTest
//
//  Created by 方冬冬 on 2017/10/13.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ExamplTwoViewController.h"

@interface ExamplTwoViewController ()
@property(nonatomic,assign)NSInteger count;
@property (weak, nonatomic) IBOutlet UILabel *timeLab;

@end

@implementation ExamplTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //定时器写法一
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //定时器写法二  两种写法等价
    //    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
    
}

- (void)timerUpdate{
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"%@",[NSRunLoop currentRunLoop].currentMode);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.count ++;
        NSString *timeText = [NSString stringWithFormat:@"计时器:%ld",self.count];
        
        self.timeLab.text =timeText;
    });
}

@end
