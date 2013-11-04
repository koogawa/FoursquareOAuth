//
//  ViewController.m
//  FsqOAuthDemo
//
//  Created by Kosuke Ogawa on 2013/11/03.
//  Copyright (c) 2013 @koogawa. All rights reserved.
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

- (IBAction)authButtonTapped:(id)sender
{
    // Open auth view
    FsqOAuthViewController *viewController = [[FsqOAuthViewController alloc] init];
    viewController.delegate = self;
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
    [self presentViewController:naviController animated:YES completion:nil];
}

- (IBAction)logoutButtonTapped:(id)sender
{
    self.tokenTextView.text = @"";
    
    // Clear cookie to logout
    NSHTTPCookieStorage *cookieStrage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (id obj in [cookieStrage cookies]) {
        [cookieStrage deleteCookie:obj];
    }
}

#pragma mark - FsqOAuthViewController delegate

- (void)fsqOAuthViewController:(FsqOAuthViewController *)viewController didSucceedWithAccessToken:(NSString *)token
{
    self.tokenTextView.text = token;
}

/*
- (void)fsqOAuthViewController:(FsqOAuthViewController *)viewController didFailWithError:(NSError *)error
{
    self.tokenTextView.text = [error description];
}
*/

@end
