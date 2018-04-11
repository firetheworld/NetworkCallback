//
//  CallBackObj.m
//  NetworkCallback
//
//  Created by 郑良凯 on 2018/4/11.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import "CallbackObj.h"

@implementation CallbackObj

+ (instancetype)shareInstance {
	static CallbackObj *obj = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		obj = [[CallbackObj alloc] init];
	});
	return obj;
}

- (void)testDelegate {
	BOOL isMain = [NSThread isMainThread];
	if (!isMain) {
		dispatch_async(dispatch_get_main_queue(), ^{
			[self.delegate hasCallBack];
		});
	}
	else {
		[self.delegate hasCallBack];
	}
}

- (void)testBlock:(CallbackBlock)block {
	BOOL isMain = [NSThread isMainThread];
	if (!isMain) {
		dispatch_async(dispatch_get_main_queue(), ^{
			block();
		});
	}
	else {
		block();
	}
}

@end
