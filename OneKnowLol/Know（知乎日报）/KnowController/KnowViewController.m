//
//  KnowViewController.m
//  OneKnowLol
//
//  Created by Ardee on 16/8/23.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "KnowViewController.h"
#import "KnowEngine.h"
#import "KnowTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "KnowBody.h"
#import "KnowBannerBody.h"
#import <UIImageView+AFNetworking.h>
#import "DCPicScrollView.h"
#import "DCWebImageManager.h"
#import "BGHeaderRefreshView.h"

@interface KnowViewController ()<UITableViewDelegate,UITableViewDataSource>

{
    UITableView *_knowTable;
    NSArray *_storiesArr;
    NSArray *_topArr;
    float rowHeheight;
}
@property (weak, nonatomic) BGHeaderRefreshView* Header;//头部下拉刷新控件
@end


@implementation KnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _storiesArr = [[NSArray alloc]init];
    _topArr = [[NSArray alloc]init];
    [self creatTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//不要tableView下移一块
    [KnowEngine getKnowContextWithStoriesComplent:^(NSArray *storiesArr)
    {
        NSLog(@"成功了吗?");
        _storiesArr = storiesArr;
    } withTopComplent:^(NSArray *topArr)
    {
        NSLog(@"成功了!");
        _topArr = topArr;
        [_knowTable reloadData];
    }];
    if (_Header == nil) {
        BGHeaderRefreshView* header = [[BGHeaderRefreshView alloc] init];
        _Header = header;
        header.style = clrcleAround;
        header.hideIcon = YES;//设置下拉的时候隐藏刷新图片与否
        header.block = ^{
            [KnowEngine getKnowContextWithStoriesComplent:^(NSArray *storiesArr)
             {
                 NSLog(@"成功了吗?");
                 _storiesArr = storiesArr;
             } withTopComplent:^(NSArray *topArr)
             {
                 NSLog(@"成功了!");
                 _topArr = topArr;
                 [_knowTable reloadData];
             }];
        };
        header.scrollview = _knowTable;//将tableview绑定过去
    }
    
}
#pragma mark --创建知乎日报的列表--
- (void)creatTableView
{
    _knowTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-112) style:(UITableViewStyleGrouped)];
    _knowTable.dataSource = self;
    _knowTable.delegate = self;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:106/255.0 green:202/255.0 blue:246/255.0 alpha:1];//导航栏为主题色
    self.view.backgroundColor = [UIColor colorWithRed:106/255.0 green:202/255.0 blue:246/255.0 alpha:1];
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor],                                                                    UITextAttributeFont : [UIFont fontWithName:@"FZHuaLi-M14" size:25]};//导航栏字体颜色样式
    [_knowTable setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"TableBackgound.png"]]];
    [self.view addSubview:_knowTable];
    
}
#pragma mark --返回区中单元格个数--
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_storiesArr count];
}
#pragma mark --返回区的个数--
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
#pragma mark --返回单元格内容--
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    KnowTableViewCell * knowCell = [tableView dequeueReusableCellWithIdentifier:@"knowCell"];
    KnowBody *storiesBody = _storiesArr[indexPath.row];
    if (knowCell==nil)
    {
        knowCell = [[KnowTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"knowCell"];
    }
    knowCell.cellTitle.text = storiesBody.title;
    [knowCell.cellImg setImageWithURL:[NSURL URLWithString:storiesBody.images[0]] placeholderImage:[UIImage imageNamed:@"PlaceHolder.png"]];
    rowHeheight = knowCell.cellImg.frame.size.height+10;
    knowCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return knowCell;
}
#pragma mark --返回区头的视图--
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _knowTable.frame.size.width, (320-10)*2/3)];
    NSMutableArray *topImgArr = [[NSMutableArray alloc]init];
    NSMutableArray *topTitleArr = [[NSMutableArray alloc]init];
    for (int i = 0; i < _topArr.count; i++)
    {
        KnowBannerBody *topBody = [_topArr objectAtIndex:i];
        [topImgArr addObject:topBody.image];
        [topTitleArr addObject:topBody.title];
    }
    DCPicScrollView  *picView1 = [DCPicScrollView picScrollViewWithFrame:CGRectMake(0,0,_knowTable.frame.size.width, (320-10)*2/3) WithImageUrls:topImgArr];
    
    picView1.style = PageControlAtCenter;
    picView1.titleData = topTitleArr;
    
    picView1.backgroundColor = [UIColor clearColor];
    [picView1 setImageViewDidTapAtIndex:^(NSInteger index) {
        printf("你点到我了😳index:%zd\n",index);
    }];
    
    picView1.AutoScrollDelay = 2.0f;
    
    [headView addSubview:picView1];
    
    return headView;
}
#pragma mark --返回区头的高度--
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return (320-10)*2/3;
}
#pragma mark --返回单元格高度--
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return rowHeheight;
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
