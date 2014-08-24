//
//  LoginViewController.m
//  SoundCloud Example
//
//  Created by Colodin on 04.08.14.
//  Copyright (c) 2014 Alexandru Colodin. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

-(id)init
{ self = [super init];
    return self;
}

+ (SCLoginViewController *)loginView:(NSURL *)anURL
                   completionHandler:(SCLoginViewControllerCompletionHandler)aCompletionHandle
{
    return  [SCLoginViewController loginViewControllerWithPreparedURL:anURL completionHandler:aCompletionHandle];
}
@end
