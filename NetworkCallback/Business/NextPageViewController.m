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

@property (nonatomic, strong) NetService* service;
@property (nonatomic, strong) NSMutableArray* pageArray; // 模拟分页请求

@end

@implementation NextPageViewController

#pragma mark - VC life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.service = [[NetService alloc] init];
	self.pageArray = @[@"page1",@"page2",@"page3"];
}

- (void)dealloc {
	NSLog(@"NextPageViewController has been dealloc!");
}

#pragma mark - Actions

- (IBAction)blockRequest:(UIButton *)sender {
	[self blockDemo];
}

- (IBAction)delegateRequest:(UIButton *)sender {

}

#pragma mark - Block request
- (void)blockDemo {
	__weak typeof(self) weakSelf = self;
	NSArray *outsideArray = @[@1, @2, @3];
	[self.service requestWithParms:nil WithResult:^(id data, NSError *error) {
		
		// 保护代码
		if (weakSelf == nil) {
			return;
		}
		
		// 处理业务逻辑
		// ...
		
		// 导致crash
//		NSMutableArray *muteArray = outsideArray.mutableCopy;
//		[muteArray addObject:weakSelf.pageArray];
		
		NSLog(@"Result from block:%@", data);
		NSLog(@"outsideArray :%@", outsideArray);
//		NSLog(@"self :%@", self);
		NSLog(@"weakSelf :%@", weakSelf);
	}];
}

#pragma mark - Delegate request
- (void)delegateDemo {
	
}
@end
