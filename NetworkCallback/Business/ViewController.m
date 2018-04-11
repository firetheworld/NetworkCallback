//
//  ViewController.m
//  NetworkCallback
//
//  Created by 郑良凯 on 2018/3/25.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import "ViewController.h"
#import "NextPageViewController.h"
#import "CallbackObj.h"

#define LOOPCOUNT 10000

@interface ViewController () <CallbackDelegate>

@property (nonatomic, strong) CallbackObj *callbackObj;

@end

@implementation ViewController {
	NSDate * _stratDate;
}

#pragma mark - VC life Cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.callbackObj = [CallbackObj shareInstance];
	self.callbackObj.delegate = self;
}


#pragma mark - Actions

- (IBAction)jumpToNextPage:(UIButton *)sender {
	
	NextPageViewController *vc = [[NextPageViewController alloc] initWithNibName:@"NextPageViewController" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)testBlock:(UIButton *)sender {
	
	NSDate *start = [NSDate date];
	
	for (int i = 0; i < LOOPCOUNT; i++) {
		[self.callbackObj testBlock:^{
			NSTimeInterval timeInterval = [start timeIntervalSinceNow];
			NSLog(@"testBlock:%f", timeInterval);
		}];
	}
}

- (IBAction)testDelegate:(UIButton *)sender {
	_stratDate = [NSDate date];
	
	for (int i = 0; i < LOOPCOUNT; i++) {
		[self.callbackObj testDelegate];
	}
}

#pragma mark - Delegate
- (void)hasCallBack {
	NSTimeInterval timeInterval = [_stratDate timeIntervalSinceNow];
	NSLog(@"testDelegate:%f", timeInterval);
}
@end
