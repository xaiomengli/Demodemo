//
//  UserDefaultViewController.m
//  FIleHandleDemoTest
//
//  Created by qingyun on 15/10/16.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "UserDefaultViewController.h"

@interface UserDefaultViewController ()
@property (weak, nonatomic) IBOutlet UISlider *qySlider;
@property (weak, nonatomic) IBOutlet UISwitch *aySwitch;

@end

@implementation UserDefaultViewController

-(void)saveValue
{
    
    float value = _qySlider.value;
    BOOL isOn = _aySwitch.on;
    
    NSUserDefaults *defaut = [NSUserDefaults standardUserDefaults];
    
    [defaut setObject:[NSNumber numberWithFloat:value] forKey:@"sliderValue"];
    [defaut setObject:[NSNumber numberWithBool:isOn] forKey:@"swithOn"];
    
    [defaut synchronize];
    
    
    
}
-(void)getValue
{
    NSUserDefaults *defaut = [NSUserDefaults standardUserDefaults];
    
    float value = [[defaut objectForKey:@"sliderValue"] floatValue];
    
    BOOL isOn = [[defaut objectForKey:@"swithOn"] boolValue];
    _qySlider.value = value;
    _aySwitch.on = isOn;
    
}

-(void)addSubView
{
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveValue)];
    self.navigationItem.rightBarButtonItem = btnItem;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubView];
    [self getValue];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
