//
//  NetPageViewController.m
//  NetworkCallback
//
//  Created by 郑良凯 on 2018/3/25.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import "NextPageViewController.h"
#import "NetService.h"

@interface NextPageViewController ()

@end

@implementation NextPageViewController

#pragma mark - VC life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Actions

- (IBAction)blockRequest:(UIButton *)sender {
	[self blockDemo];
}

- (IBAction)delegateRequest:(UIButton *)sender {

}

#pragma mark - Block request
- (void)blockDemo {
	[[NetService alloc] requestWithParms:nil WithResult:^(id data, NSError *error) {
		NSLog(@"Result from block:%@", data);
	}];
}

#pragma mark - Delegate request
- (void)delegateDemo {
	
}
@end
