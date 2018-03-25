//
//  RequestAPI.m
//  NetworkCallback
//
//  Created by 郑良凯 on 2018/3/25.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import "RequestAPI.h"

@implementation RequestAPI

- (void)requestWithParms:(NSDictionary *)parms {
	__weak typeof(self) weakSelf = self;
	[[NetService alloc] requestWithParms:parms WithResult:^(id  _Nonnull data, NSError * _Nonnull error) {
		if (weakSelf && [weakSelf respondsToSelector:@selector(networkFinishWithSuccess:AndError:)]) {
			[self.delegate networkFinishWithSuccess:data AndError:nil];
		}
	}];
}

@end
