//
//  SJAvatarBrowser.h
//  OneKnowLol
//
//  Created by Ardee on 16/9/8.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SJAvatarBrowser : NSObject

/**
 *  @brief  浏览头像
 *
 *  @param  oldImageView    头像所在的imageView
 */

+ (void)showImage:(UIImageView *)avatarImageView;
@property (nonatomic,strong)UIImageView *sentImg;
@end
