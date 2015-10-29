//
//  ViewController.m
//  FIleHandleDemoTest
//
//  Created by qingyun on 15/10/16.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "CAPISViewController.h"
#import "OCAPISViewController.h"
#import "UserDefaultViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
 _dataArr=@[@"CAPISViewController",@"OCAPISViewController",@"UserDefaultViewController"];

    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _dataArr.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify  = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    cell.textLabel.text = _dataArr[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *controller = [NSClassFromString(_dataArr[indexPath.row]) new];
    
    
    [self.navigationController pushViewController:controller animated:YES];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
