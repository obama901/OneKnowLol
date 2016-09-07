//
//  OneViewController.m
//  OneKnowLol
//
//  Created by Ardee on 16/8/23.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "OneViewController.h"
#import "OneViewEngine.h"
#import "OneTableViewCell.h"


@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    OneViewBody *_viewBody;
    UITableView *_oneTable;
}
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:106/255.0 green:202/255.0 blue:246/255.0 alpha:1];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [OneViewEngine getOneViewNoteWithComplentBlock:^(OneViewBody *noteBody)
     {
         _viewBody = noteBody;
         [_oneTable reloadData];
         NSLog(@"请求成功！");
     }];
    [self creatSrcollView];
}
#pragma mark --创建横向滑动的视图--
- (void)creatSrcollView
{
    _oneTable = [[UITableView alloc]initWithFrame:CGRectMake(5, 64, self.view.frame.size.width-10, self.view.frame.size.height-112) style:UITableViewStyleGrouped];
    _oneTable.dataSource = self;
    _oneTable.delegate = self;
    [self.view addSubview:_oneTable];
//    _oneTable.backgroundColor = [UIColor colorWithRed:106/255.0 green:202/255.0 blue:246/255.0 alpha:1];    
    [_oneTable setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TableBackgound.png"]]];
}
#pragma mark --返回一个区中有多少单元格--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
#pragma mark --返回tableView有多少个区--
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark --返回单元格内容--
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil)
    {
        cell = [[OneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell._dateNum.text = _viewBody.volNum;
    cell._imgSource.text = _viewBody.imgSource;
    cell._context.text = _viewBody.noteContext;
    return cell;
}
#pragma mark --返回单元格高度--
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 500;
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
