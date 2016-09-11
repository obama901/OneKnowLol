//
//  KnowTableViewCell.m
//  OneKnowLol
//
//  Created by Ardee on 16/9/10.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "KnowTableViewCell.h"


@implementation KnowTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        //创建单元格图片
        UIImageView *cellImg = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, self.contentView.frame.size.width/3, self.contentView.frame.size.width/3)];
        self.cellImg = cellImg;
        [self.contentView addSubview:cellImg];
        
        //创建单元格标题
        UILabel *cellTitle = [[UILabel alloc]initWithFrame:CGRectMake(10+cellImg.frame.size.width, 5, self.contentView.frame.size.width-cellImg.frame.size.width-20, cellImg.frame.size.height*3/5)];
        cellTitle.font = [UIFont systemFontOfSize:15];
        cellTitle.numberOfLines = 3;
        self.cellTitle = cellTitle;
        [self.contentView addSubview:cellTitle];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
