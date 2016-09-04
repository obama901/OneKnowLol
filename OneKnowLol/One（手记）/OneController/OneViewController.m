//
//  OneViewController.m
//  OneKnowLol
//
//  Created by Ardee on 16/8/23.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "OneViewController.h"
#import "OneViewEngine.h"


@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatSrcollView];
}
#pragma mark --创建横向滑动的视图--
- (void)creatSrcollView
{
    UITableView *oneTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-112) style:UITableViewStyleGrouped];
    [self.view addSubview:oneTable];
    oneTable.backgroundColor = [UIColor redColor];
    
    [OneViewEngine getOneViewNoteWithComplentBlock:^(OneViewBody *noteBody)
    {
        NSLog(@"请求成功！");
    }];
}
//#pragma mark --返回一个区中有多少单元格--
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 5;
//}
//#pragma mark --返回tableView有多少个区--
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}
//#pragma mark --返回单元格内容--
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell = [[UITableViewCell alloc] init];
//    
//    return cell;
//}
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
