//
//  ViewController.m
//  NetworkCallback
//
//  Created by 郑良凯 on 2018/3/25.
//  Copyright © 2018年 datayes. All rights reserved.
//

#import "ViewController.h"
#import "NextPageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - VC life Cycle
- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - Actions

- (IBAction)jumpToNextPage:(UIButton *)sender {
	
	NextPageViewController *vc = [[NextPageViewController alloc] initWithNibName:@"NextPageViewController" bundle:[NSBundle mainBundle]];
	[self.navigationController pushViewController:vc animated:YES];
}
@end
