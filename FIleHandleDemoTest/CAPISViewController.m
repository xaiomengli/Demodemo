//
//  CAPISViewController.m
//  FIleHandleDemoTest
//
//  Created by qingyun on 15/10/16.
//  Copyright (c) 2015年 河南青云信息技术有限公司. All rights reserved.
//

#import "CAPISViewController.h"

@interface CAPISViewController ()
@property(nonatomic,strong)UITextField *tf;

@end

@implementation CAPISViewController


-(void)saveFile
{
    
    const char *path = [[self getFilePath] UTF8String];
    
    FILE *fp = fopen(path, "w+");
    
    if (fp == NULL) {
        perror("fopen");
        return;
    }
    
    NSString *saveText = _tf.text;
    NSInteger leng = saveText.length;
    
    size_t  count = fwrite([saveText UTF8String], leng, 1, fp);
    if (count>0) {
        NSLog(@"文件保存成功");
    }
    
    fclose(fp);
}

-(NSString *)readFile
{
    const char *path = [[self getFilePath] UTF8String];
    
    FILE *file = fopen(path, "r");
    if (file == NULL) {
        perror("失败");
        return nil;
    }
    
    
    fseek(file, 0, SEEK_END);
    long size = ftell(file);
    
    char buf[256]= {0};
    rewind(file);
    size_t count = fread(buf, size, 1, file);
    
    if (count<= 0) {
        fclose(file);
        NSLog(@"=====失败");
        return nil;
    }
    
    fclose(file);
    NSString *str = [NSString stringWithUTF8String:buf];
    
    return str;
    
}

-(NSString *)getFilePath
{
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
    
    NSLog(@"======%@",path);
    
    return [path stringByAppendingPathComponent:@"/c.txt"];
    
    
}

-(void)addSubview
{
    _tf= [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 150, 40)];
    _tf.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:_tf];
    
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:nil action:@selector(saveFile)];
    self.navigationItem.rightBarButtonItem = btn;

    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addSubview];
    
    NSString *readFile = [self readFile];
    if (readFile) {
        _tf.text = readFile;
    }
    
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
