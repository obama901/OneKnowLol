//
//  KnowBannerBody.m
//  OneKnowLol
//
//  Created by Ardee on 16/9/10.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "KnowBannerBody.h"

@implementation KnowBannerBody

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.Id = value;
    }
    return;
}
@end
