//
//  TabViewController.m
//  OneKnowLol
//
//  Created by Ardee on 16/8/23.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "TabViewController.h"
#import "OneViewController.h"
#import "KnowViewController.h"
#import "LOLViewController.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self joinTabViewController];
}
#pragma mark --把创建的ViewController加入Tabbar之中--
- (void)joinTabViewController
{
    //创建One一个的手记选项卡
    OneViewController *oneVC = [[OneViewController alloc]init];
    oneVC.title = @"手记";
    UINavigationController *oneNavC = [[UINavigationController alloc]initWithRootViewController:oneVC];
    UITabBarItem *oneItem = [[UITabBarItem alloc]initWithTitle:@"手记" image:[[UIImage imageNamed:@"tabOne.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabOneSe.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    oneNavC.tabBarItem = oneItem;
    
    //创建知乎日报的日报选项卡
    KnowViewController *knowVC = [[KnowViewController alloc]init];
    knowVC.title = @"日报";
    UINavigationController *knowNavC = [[UINavigationController alloc]initWithRootViewController:knowVC];
    UITabBarItem *knowItem = [[UITabBarItem alloc]initWithTitle:@"日报" image:[[UIImage imageNamed:@"tabKnow.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabKnowSe.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    knowNavC.tabBarItem = knowItem;
    //创建英雄联盟的联盟选项卡
    LOLViewController *lolVC = [[LOLViewController alloc]init];
    lolVC.title = @"联盟";
    UINavigationController *lolNavC = [[UINavigationController  alloc]initWithRootViewController:lolVC];
    UITabBarItem *lolItem = [[UITabBarItem alloc]initWithTitle:@"联盟" image:[[UIImage imageNamed:@"tabLOL.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"tabLOLSe.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    lolNavC.tabBarItem = lolItem;
    
    //把控制器加入选项卡槽
    self.viewControllers = @[oneNavC,knowNavC,lolNavC];
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
