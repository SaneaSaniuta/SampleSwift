//
//  LoginViewController.h
//  SoundCloud Example
//
//  Created by Colodin on 04.08.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//
//CocoaSoundCloudUI/SCShareViewController.h:24: cannot find interface declaration for 'UINavigationController', superclass of 'SCShareViewController'

#import <UIKit/UIKit.h>
#import <SCUI.h>

@interface LoginViewController : SCLoginViewController
+ (SCLoginViewController *)loginView:(NSURL *)anURL
                                            completionHandler:(SCLoginViewControllerCompletionHandler)aCompletionHandler;
@end
