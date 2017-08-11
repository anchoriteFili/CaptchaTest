//
//  ViewController.m
//  CaptchaTest
//
//  Created by 赵宏亚 on 2017/8/11.
//  Copyright © 2017年 赵宏亚. All rights reserved.
//

#import "ViewController.h"
#import "AuthcodeView.h"

@interface ViewController ()

@property (nonatomic,retain) AuthcodeView *authCodeView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //显示验证码界面
    self.authCodeView = [[AuthcodeView alloc] initWithFrame:CGRectMake(30, 100, 71, 32)];
    [self.view addSubview:self.authCodeView];
}

- (IBAction)click:(UIButton *)sender {
    
    NSLog(@"authCodeStr ====== %@",self.authCodeView.authCodeStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
