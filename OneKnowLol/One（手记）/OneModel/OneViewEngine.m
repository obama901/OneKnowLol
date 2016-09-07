//
//  OneViewEngine.m
//  OneKnowLol
//
//  Created by Ardee on 16/9/3.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import "OneViewEngine.h"


@implementation OneViewEngine

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
        NSLog(@"期数是：%@",oneBody.volNum);
        complentBlock(oneBody);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"error==%@",error);
    }];
}
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
