//
//  FsqOAuthViewController.h
//  FsqOAuthDemo
//
//  Created by Kosuke Ogawa on 2013/11/04.
//  Copyright (c) 2013 @koogawa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FsqOAuthViewController : UIViewController <UIWebViewDelegate>
{
    UIWebView               *_webView;
	UIActivityIndicatorView *_indicatorView;
}

@end
