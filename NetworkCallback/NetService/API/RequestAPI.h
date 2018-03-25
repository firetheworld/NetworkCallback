//
//  RequestAPI.h
//  NetworkCallback
//
//  Created by 郑良凯 on 2018/3/25.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetService.h"

@interface RequestAPI : NSObject

@property (nonatomic, weak, nullable) id<NetWorkDelegate> delegate;

/**
 模拟Delegate请求方法
 
 @param parms 请求参数
 */
- (void)requestWithParms:(NSDictionary *)parms;

@end
