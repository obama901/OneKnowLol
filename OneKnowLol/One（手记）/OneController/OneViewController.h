//
//  OneViewController.h
//  OneKnowLol
//
//  Created by Ardee on 16/8/23.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OneViewBody.h"

@interface OneViewController : UIViewController

{
    OneViewBody *_viewBody;
    UITableView *_oneTable;
    CGFloat cellHight;//单元格的动态高度
    UIImageView *_cellImg;
}
@end
