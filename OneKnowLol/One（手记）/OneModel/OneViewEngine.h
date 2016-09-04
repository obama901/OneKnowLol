//
//  OneViewEngine.h
//  OneKnowLol
//
//  Created by Ardee on 16/9/3.
//  Copyright © 2016年 Ardee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HeaderFile.h"
#import <AFHTTPRequestOperationManager.h>
#import "OneViewBody.h"

@interface OneViewEngine : NSObject

+ (void)getOneViewNoteWithComplentBlock:(void(^)(OneViewBody *))complentBlock;

@end
