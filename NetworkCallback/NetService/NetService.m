//
//  NetService.m
//  NetworkCallback
//
//  Created by 郑良凯 on 2018/3/25.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import "NetService.h"

const int NET_DELAY = 5;

@implementation NetService

- (void)requestWithParms:(NSDictionary *)parms WithResult:(ResultBlock)result {
	
	int delay = NET_DELAY;
	
	if ([parms valueForKey:@"delayTime"] != nil) {
		delay = (int)[parms valueForKey:@"delayTime"];
	}
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		
		// 判断成功
		// 判断失败
		
		NSString *resultData = @"This is a Mock Data!!";
		NSLog(@"Network Finish:%@",resultData);
		if (result) {
			result(resultData, nil);
		}
	});
}

@end
