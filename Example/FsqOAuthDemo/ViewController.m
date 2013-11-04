//
//  ViewController.m
//  FsqOAuthDemo
//
//  Created by @koogawa on 2013/11/03.
//  Copyright (c) 2013年 @koogawa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)authButtonTapped:(id)sender
{
    NSLog(@"OK");
    self.tokenTextView.text = @"aaa";
    
    // Open auth view
    FsqOAuthViewController *viewController = [[FsqOAuthViewController alloc] init];
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:naviController animated:YES completion:nil];
}

// ログイン成功したらトークン表示

@end
