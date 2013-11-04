//
//  ViewController.h
//  FsqOAuthDemo
//
//  Created by Kosuke Ogawa on 2013/11/03.
//  Copyright (c) 2013 @koogawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FsqOAuthViewController.h"

@interface ViewController : UIViewController <FsqOAuthViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *tokenTextView;

- (IBAction)authButtonTapped:(id)sender;
- (IBAction)logoutButtonTapped:(id)sender;

@end
