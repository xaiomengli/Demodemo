//
//  OCAPISViewController.m
//  FIleHandleDemoTest
//
//  Created by qingyun on 15/10/16.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "OCAPISViewController.h"

@interface OCAPISViewController ()

@property(nonatomic,strong)UITextField *tf;

@end

@implementation OCAPISViewController

-(NSString *)getFile
{
    NSString *libaryPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
    NSString *directioryPath = [libaryPath stringByAppendingPathComponent:@"temp"];
    
    if ([manager createDirectoryAtPath:directioryPath withIntermediateDirectories:YES attributes:nil error:nil]) {
        NSLog(@"====文件夹创建成功");
    }
    
    
    NSString *filePath = [directioryPath stringByAppendingPathComponent:@"ocapd.txt"];
    
    if (![manager fileExistsAtPath:filePath]) {
        [manager createFileAtPath:filePath contents:nil attributes:nil];
        NSLog(@"======%@",filePath);
    }
    
    return filePath;
    
    
    
}


-(NSString *)readFile
{
    
    NSError *error;
    NSString *content = [[NSString alloc] initWithContentsOfFile:[self getFile] encoding:NSUTF8StringEncoding error:&error];
    
    return content;
    
}

-(void)saveFile
{
    NSString *content = _tf.text;
    
    NSError *error;
    if ([content writeToFile:[self getFile] atomically:YES encoding:NSUTF8StringEncoding error:&error]) {
        NSLog(@"====%@",error);
    }
    
    NSLog(@"保存成功");
    
}

-(void)addSubview
{
    _tf= [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 150, 40)];
    _tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_tf];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveFile)];

    self.navigationItem.rightBarButtonItem = btn;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubview];
    _tf.text = [self readFile];
    // Do any additional setup after loading the view.
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
