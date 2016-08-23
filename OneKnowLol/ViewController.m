//
//  ViewController.m
//  OneKnowLol
//
//  Created by Ardee on 16/8/23.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "ViewController.h"
#import "TabViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TabViewController *tabVC = [[TabViewController alloc]init];
    UIWindow *window = [[[UIApplication sharedApplication]delegate              ]window];
    window.rootViewController = tabVC;//将选项卡设置成根视图
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
