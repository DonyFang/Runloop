//
//  ExampleOneViewController.m
//  RunloopTest
//
//  Created by 方冬冬 on 2017/10/13.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ExampleOneViewController.h"
#import "FDDThread.h"

@interface ExampleOneViewController ()
@property(nonatomic,strong)FDDThread * testThread;

@end

@implementation ExampleOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    [self threadCreat];
    
    // 1.测试线程的销毁
    [self threadTest];
}

- (void)threadCreat{
    
    FDDThread *thread = [[FDDThread alloc] initWithTarget:self selector:@selector(subThreadOpetion) object:nil];
    [thread setName:@"testThread"];
    [thread start];
    
    self.testThread = thread;
}
//子线程在任务结束后 被销毁回收了

- (void)subThreadOpetion{
    
    @autoreleasepool{
        NSLog(@"%@----子线程任务开始",[NSThread currentThread]);
        [NSThread sleepForTimeInterval:3.0];
        NSLog(@"%@----子线程任务结束",[NSThread currentThread]);
        
    }
}

//====================================

- (void)threadTest{
    FDDThread *subThread = [[FDDThread alloc] initWithTarget:self selector:@selector(subThreadEntryPoint) object:nil];
    [subThread setName:@"FDDThread"];
    [subThread start];
    self.testThread = subThread;
    
}
/**
 子线程启动后，启动runloop
 */
- (void)subThreadEntryPoint{
    @autoreleasepool{
        NSRunLoop *runloop = [NSRunLoop currentRunLoop];
        //如果注释了下面这一行，子线程中的任务并不能正常执行(可以看到注释掉后，无论我们如何点击视图，控制台都不会有任何的输出，那是因为mode 中并没有item任务)
        [runloop addPort:[NSMachPort port] forMode:NSRunLoopCommonModes];
        NSLog(@"%@",runloop.currentMode);
        [runloop run];
    }
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(subThreadOpetions) onThread:self.testThread withObject:nil waitUntilDone:NO];
}
/**
 子线程任务
 */
- (void)subThreadOpetions
{
    NSLog(@"启动RunLoop后--%@",[NSRunLoop currentRunLoop].currentMode);
    NSLog(@"%@----子线程任务开始",[NSThread currentThread]);
    [NSThread sleepForTimeInterval:3.0];
    NSLog(@"%@----子线程任务结束",[NSThread currentThread]);
}

@end
