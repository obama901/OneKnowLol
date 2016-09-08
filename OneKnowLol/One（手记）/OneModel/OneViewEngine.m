//
//  OneViewEngine.m
//  OneKnowLol
//
//  Created by Ardee on 16/9/3.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "OneViewEngine.h"


@implementation OneViewEngine
#pragma mark --请求一个的手记数据--
+ (void)getOneViewNoteWithComplentBlock:(void (^)(OneViewBody *))complentBlock
{
    NSString *strUrl = ONE_VIEW;
    AFHTTPRequestOperationManager *manger = [AFHTTPRequestOperationManager manager];
    manger.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manger GET:strUrl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
    {
        NSData *dicData = responseObject;
        NSString *jsonStr = [[NSString alloc]initWithData:dicData encoding:NSUTF8StringEncoding];
        NSString *realJsonStr = [OneViewEngine toGetRealDataForStringWithStr:jsonStr];
        realJsonStr = [realJsonStr stringByAppendingString:@"\"evering\":\"evering\"}"];
        NSLog(@"realJsonStr==%@",realJsonStr);
        OneViewBody *oneBody = [[OneViewBody alloc]init];
        NSData *jsonData = [realJsonStr dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData                                                         options:NSJSONReadingMutableContainers                                                              error:&err];
        NSLog(@"dic==%@",jsonDic);
        [oneBody setValuesForKeysWithDictionary:jsonDic];
        complentBlock(oneBody);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"error==%@",error);
    }];
}
#pragma mark --将获取到的字符串中的一些字符替换--
+ (NSString *)toGetRealDataForStringWithStr:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"function onetitle(){document.write(" withString:@"{\"volNum\":"];
    string = [string stringByReplacingOccurrencesOfString:@");}" withString:@","];
    string = [string stringByReplacingOccurrencesOfString:@"function oneimga(){document.write(" withString:@"\"imgSource\":"];
    string = [string stringByReplacingOccurrencesOfString:@"function oneword(){document.write(" withString:@"\"noteContext\":"];
    string = [string stringByReplacingOccurrencesOfString:@"<br>" withString:@"&"];
    return string;
}

@end
