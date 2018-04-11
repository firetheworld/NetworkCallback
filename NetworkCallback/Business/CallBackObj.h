//
//  CallBackObj.h
//  NetworkCallback
//
//  Created by 郑良凯 on 2018/4/11.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CallbackBlock)();

@protocol CallbackDelegate <NSObject>

- (void)hasCallBack;

@end

@interface CallbackObj : NSObject

@property (nonatomic, weak) id <CallbackDelegate> delegate;

+ (instancetype)shareInstance;

- (void)testDelegate;

- (void)testBlock:(CallbackBlock)block;

@end
