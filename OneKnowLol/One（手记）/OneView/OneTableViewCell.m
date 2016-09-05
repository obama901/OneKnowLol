//
//  OneTableViewCell.m
//  OneKnowLol
//
//  Created by Ardee on 16/9/5.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "OneTableViewCell.h"


@implementation OneTableViewCell


- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        //手记的图片
        UIImageView *oneImg = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, self.contentView.frame.size.width-10, (self.contentView.frame.size.width-10)*487/650)];
        self._imageView = oneImg;
        [self.contentView addSubview:oneImg];
        
        //手记的期数
        UILabel *dateNum = [[UILabel alloc]initWithFrame:CGRectMake(5, 5+oneImg.frame.size.height+5, self.contentView.frame.size.width/3, 15)];
        dateNum.textAlignment = NSTextAlignmentCenter;
        dateNum.font = [UIFont systemFontOfSize:15];
        self._dateNum = dateNum;
        [self.contentView addSubview:dateNum];
        
        //手记的图片来源
        UILabel *imgSource = [[UILabel alloc]initWithFrame:CGRectMake(self.contentView.frame.size.width/3+5, 5+oneImg.frame.size.height+5, self.contentView.frame.size.width*2/3, 15)];
        NSLog(@"屏幕的2/3是：%f",self.contentView.frame.size.width*2/3);
        imgSource.textAlignment = NSTextAlignmentLeft;
        imgSource.font = [UIFont systemFontOfSize:15];
        self._imgSource = imgSource;
        [self.contentView addSubview:imgSource];
        
        //手记的文本内容
        UILabel *context = [[UILabel alloc]initWithFrame:CGRectMake(5, imgSource.frame.origin.y+imgSource.frame.size.height+5, self.contentView.frame.size.width-10, 200)];
        context.font = [UIFont systemFontOfSize:15];
        context.numberOfLines = 0;
        self._context = context;
        [self.contentView addSubview:context];
    }
    
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
