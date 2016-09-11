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
#import "SJAvatarBrowser.h"
#import "BGHeaderRefreshView.h"


@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) BGHeaderRefreshView* Header;//头部下拉刷新控件

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:106/255.0 green:202/255.0 blue:246/255.0 alpha:1];//页面是主题色背景
    self.automaticallyAdjustsScrollViewInsets = NO;//不要tableView下移一块
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:106/255.0 green:202/255.0 blue:246/255.0 alpha:1];//导航栏为主题色
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor],                                                                    UITextAttributeFont : [UIFont fontWithName:@"FZHuaLi-M14" size:25]};//导航栏字体颜色样式
        [OneViewEngine getOneViewNoteWithComplentBlock:^(OneViewBody *noteBody)
     {
         _viewBody = noteBody;
         [_oneTable reloadData];
         NSLog(@"请求成功！");
     }];
    [self creatSrcollView];
    
    if (_Header == nil) {
        BGHeaderRefreshView* header = [[BGHeaderRefreshView alloc] init];
        _Header = header;
        header.style = clrcleAround;
        header.hideIcon = YES;//设置下拉的时候隐藏刷新图片与否
        header.block = ^{
            NSLog(@"刷新完毕.....header");
            [OneViewEngine getOneViewNoteWithComplentBlock:^(OneViewBody *noteBody)
             {
                 _viewBody = noteBody;
                 [_oneTable reloadData];
                 
                 NSLog(@"请求成功！");
             }];
        };
        header.scrollview = _oneTable;//将tableview绑定过去
    }

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
#warning mark --> 退出的时候释放掉
    [self.Header free];
}
#pragma mark --创建横向滑动的视图--
- (void)creatSrcollView
{
    _oneTable = [[UITableView alloc]initWithFrame:CGRectMake(5, 64, self.view.frame.size.width-10, self.view.frame.size.height-112) style:UITableViewStyleGrouped];
    _oneTable.showsVerticalScrollIndicator = NO;
    _oneTable.dataSource = self;
    _oneTable.delegate = self;
    [self.view addSubview:_oneTable];   
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
    _cellImg = cell._imageView;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell._dateNum.text = _viewBody.volNum;
    cell._imgSource.text = _viewBody.imgSource;
    cell._context.text = _viewBody.noteContext;
    CGRect rect = [_viewBody.noteContext boundingRectWithSize:CGSizeMake(cell.contentView.frame.size.width-10, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil];//计算文字的高度来适配
    float hight = rect.size.height;
    [cell._context setFrame:CGRectMake(5, cell._imgSource.frame.origin.y+cell._imgSource.frame.size.height+5, cell.contentView.frame.size.width-10, hight+20)];
    cellHight = cell._imageView.frame.size.height+cell._imgSource.frame.size.height+cell._context.frame.size.height+20;
    cell.layer.shadowOffset = CGSizeMake(0, 1);//开始设置阴影
    cell.layer.shadowColor = [UIColor grayColor].CGColor;
    cell.layer.shadowRadius = 1;
    cell.layer.shadowOpacity = .5f;
    CGRect shadowFrame = cell.layer.bounds;
    CGPathRef shadowPath = [UIBezierPath
                            bezierPathWithRect:shadowFrame].CGPath;
    cell.layer.shadowPath = shadowPath;//结束设置阴影
       return cell;
}
#pragma mark --返回单元格高度--
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHight;
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
