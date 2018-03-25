//
//  NetService.h
//  NetworkCallback
//
//  Created by 郑良凯 on 2018/3/25.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/*
 Block 模式
 */
typedef void (^ResultBlock)(id data, NSError *error); // 返回结果
typedef void (^NetSuccessBlock)(id data); // 访问成功block
typedef void (^NetErrorBlock)(NSError *error); // 访问失败block


/*
 Delegate 模式
 */
@protocol NetWorkDelegate <NSObject>

@required
- (void)networkFinishWithSuccess:(id)data AndError:(NSError *)error;
@end

@interface NetService : NSObject

@property (nonatomic, weak, nullable) id<NetWorkDelegate> delegate;

/**
 模拟Block请求方法

 @param parms 请求参数
 @param result 返回结果回调
 */
- (void)requestWithParms:(NSDictionary *)parms WithResult:(ResultBlock)result;

/**
 模拟Delegate请求方法

 @param parms 请求参数
 */
- (void)requestWithParms:(NSDictionary *)parms;

@end
NS_ASSUME_NONNULL_END
