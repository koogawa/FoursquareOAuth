//
//  FsqOAuthViewController.m
//  FsqOAuthDemo
//
//  Created by Kosuke Ogawa on 2013/11/04.
//  Copyright (c) 2013 @koogawa. All rights reserved.
//

#import "FsqOAuthViewController.h"

@interface FsqOAuthViewController ()

@end

@implementation FsqOAuthViewController

#define FSQ_AUTH_URI_FORMAT     @"https://foursquare.com/oauth2/authenticate?client_id=%@&response_type=token&redirect_uri=%@"
#define FSQ_CLIENT_ID			@"(YOUR CLIENT ID)"
#define FSQ_CALLBACK_URL        @"(YOUR CALLBACK URL)"

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Login";
    
    // Webview for authentication
	_webView = [[UIWebView alloc] init];
	_webView.delegate = self;
	_webView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	_webView.scalesPageToFit = YES;
	[self.view addSubview:_webView];
    
	// Cancel button (if needed)
    UIBarButtonItem *cancelButton =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                  target:self
                                                  action:@selector(cancelButtonTapped)];
    self.navigationItem.leftBarButtonItem = cancelButton;
    
	// Activity Indicator
	_indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicatorView.center = _webView.center;
	[self.view addSubview:_indicatorView];
    
    // Start Authentication
    NSString *authenticateURLString = [NSString stringWithFormat:FSQ_AUTH_URI_FORMAT, FSQ_CLIENT_ID, FSQ_CALLBACK_URL];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:authenticateURLString]];
    [_webView loadRequest:request];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method

- (void)cancelButtonTapped
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIWebView delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString = [[request URL] absoluteString];
    if ([urlString rangeOfString:@"access_token="].location != NSNotFound)
    {
        // Auth Success!
        NSString *accessToken = [[urlString componentsSeparatedByString:@"="] lastObject];
        
        if ([self.delegate respondsToSelector:@selector(fsqOAuthViewController:didSucceedWithAccessToken:)]) {
            [self.delegate fsqOAuthViewController:self didSucceedWithAccessToken:accessToken];
        }

        if (![self isBeingDismissed]) {
            [self dismissViewControllerAnimated:YES completion:NULL];
        }
        
        return NO;
    }
    
	return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	[_indicatorView startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[_indicatorView stopAnimating];
}

// NOTE: This method is called if Redirect URI is http://localhost or urlsheme://
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	[_indicatorView stopAnimating];
    
    if ([self.delegate respondsToSelector:@selector(fsqOAuthViewController:didFailWithError:)]) {
        [self.delegate fsqOAuthViewController:self didFailWithError:error];
    }
}

@end
