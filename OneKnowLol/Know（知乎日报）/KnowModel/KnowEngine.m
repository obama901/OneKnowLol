//
//  KnowEngine.m
//  OneKnowLol
//
//  Created by Ardee on 16/9/10.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "KnowEngine.h"
#import <AFHTTPRequestOperationManager.h>
#import "KnowBody.h"
#import "KnowBannerBody.h"

@implementation KnowEngine

+ (void)getKnowContextWithStoriesComplent:(void(^)(NSArray *))storiesBlock withTopComplent:(void(^)(NSArray *))topBlock
{
    NSString *url = @"http://news-at.zhihu.com/api/4/news/latest";
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    [manger GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
    {
        NSDictionary *resDic = (NSDictionary *)responseObject;
        NSMutableArray *storiesArr = [[NSMutableArray alloc]init];
        for (NSDictionary * storiesDic in resDic[@"stories"])
        {
            KnowBody *storiesBody = [[KnowBody alloc]init];
            [storiesBody setValuesForKeysWithDictionary:storiesDic];
            [storiesArr addObject:storiesBody];
        }
        storiesBlock(storiesArr);
        NSMutableArray *topArr = [[NSMutableArray alloc]init];
        for (NSDictionary *topDic in resDic[@"top_stories"])
        {
            KnowBannerBody *topBody = [[KnowBannerBody alloc]init];
            [topBody setValuesForKeysWithDictionary:topDic];
            [topArr addObject:topBody];
        }
        topBlock(topArr);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"请求日报列表的error=%@",error);
    }];
}



@end
