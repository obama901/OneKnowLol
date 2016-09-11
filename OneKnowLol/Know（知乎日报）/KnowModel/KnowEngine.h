//
//  KnowEngine.h
//  OneKnowLol
//
//  Created by Ardee on 16/9/10.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KnowEngine : NSObject


+ (void)getKnowContextWithStoriesComplent:(void(^)(NSArray *))storiesBlock withTopComplent:(void(^)(NSArray *))topBlock;

@end
