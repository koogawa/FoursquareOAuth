//
//  ViewController.h
//  FsqOAuthDemo
//
//  Created by koogawa on 2013/11/03.
//  Copyright (c) 2013年 @koogawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FsqOAuthViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *tokenTextView;

- (IBAction)authButtonTapped:(id)sender;
// TODO: LOGOUT
@end
