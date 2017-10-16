//
//  ViewController.m
//  RunloopTest
//
//  Created by 方冬冬 on 2017/10/13.
//  Copyright © 2017年 方冬冬. All rights reserved.
//

#import "ViewController.h"
#import "ExampleOneViewController.h"

#import "ExamplTwoViewController.h"
#import "ExampleThreeViewController.h"
#import "ExampleFourViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *mainTable;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.mainTable];
    self.mainTable.delegate = self;
    self.mainTable.dataSource = self;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Runloop使用场景一";
        
    }else if(indexPath.row == 1){
        cell.textLabel.text = @"Runloop使用场景二";
        
    }else if (indexPath.row == 2){
        cell.textLabel.text = @"Runloop使用场景三";
    }else if (indexPath.row == 3){
        cell.textLabel.text = @"Runloop使用场景四";
    }else if (indexPath.row == 4){
        cell.textLabel.text = @"Runloop使用场景五";
        
    }
    
    
    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        ExampleOneViewController *one = [[ExampleOneViewController alloc] init];
        [self.navigationController pushViewController:one animated:YES];
    }else if(indexPath.row ==1){
        ExamplTwoViewController *two = [[ExamplTwoViewController alloc] init];
        [self.navigationController pushViewController:two animated:YES];
        
    }else if (indexPath.row == 2){
        
        ExampleThreeViewController *three = [[ExampleThreeViewController alloc] init];
        
        [self.navigationController pushViewController:three animated:YES];
    }else if (indexPath.row == 3){
        
        ExampleFourViewController *four = [[ExampleFourViewController alloc] init];
        [self.navigationController pushViewController:four animated:YES];
        
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}





- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
    
}



@end
