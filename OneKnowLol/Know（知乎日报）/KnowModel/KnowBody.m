//
//  KnowBody.m
//  OneKnowLol
//
//  Created by Ardee on 16/9/10.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "KnowBody.h"

@implementation KnowBody

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"])
    {
        self.Id = value;
    }
    return;
}
@end
