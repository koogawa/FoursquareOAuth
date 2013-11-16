FoursquareOAuth
===============

FoursquareOAuth is simple library to connect with Foursquare via OAuth 2.0.

<img alt="Main Screenshot" src="http://cdn-ak.f.st-hatena.com/images/fotolife/k/koogawa/20131104/20131104193114.png?1383561225" width="240px" style="width: 240px;" />

Install
=======

1. Register your app to obtain its foursquare API credentials at [http://foursquare.com/developers/apps](http://foursquare.com/developers/apps).
2. Add `FsqOAuthViewController.{h,m}` to your Xcode project.

Usage
=====

The usage is very simple. You only need to display the FsqOAuthViewController.

For example:
```
FsqOAuthViewController *viewController = [[FsqOAuthViewController alloc] initWithClientId:FSQ_CLIENT_ID
                                                                                     callback:FSQ_CALLBACK_URL];
viewController.delegate = self;
UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:viewController];
[self presentViewController:naviController animated:YES completion:nil];
```

If authentication is successful, Following method is called.

```
- (void)fsqOAuthViewController:(FsqOAuthViewController *)viewController didSucceedWithAccessToken:(NSString *)token
```

If authentication is failure, Following method is called.

```
- (void)fsqOAuthViewController:(FsqOAuthViewController *)viewController didFailWithError:(NSError *)error
```

Build Demo App
=============================

The demo application can be used as a simple reference for how to use the FoursquareOAuth. Build `Example/FsqOAuthDemo.xcodeproj`.

Maintainer
=====

Kosuke Ogawa ([@koogawa](http://twitter.com/koogawa))
