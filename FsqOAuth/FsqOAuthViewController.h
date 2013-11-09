//
//  FsqOAuthViewController.h
//  FsqOAuthDemo
//
//  Created by Kosuke Ogawa on 2013/11/04.
//  Copyright (c) 2013 @koogawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FsqOAuthViewController;

@protocol FsqOAuthViewControllerDelegate <NSObject>
@optional
- (void)fsqOAuthViewController:(FsqOAuthViewController *)viewController didSucceedWithAccessToken:(NSString *)token;
- (void)fsqOAuthViewController:(FsqOAuthViewController *)viewController didFailWithError:(NSError *)error;
@end

@interface FsqOAuthViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView               *_webView;
	UIActivityIndicatorView *_indicatorView;
}

@property (nonatomic, assign) id <FsqOAuthViewControllerDelegate>   delegate;

@property (strong, readonly) const NSString *clienId;
@property (strong, readonly) const NSString *callback;

- (id)initWithClientId:(const NSString *)clientId callback:(const NSString *)callback;

@end
