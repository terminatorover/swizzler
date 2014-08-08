//
//  RGLoginCoordinator.h
//  LineAfterAfterLineBarCode
//
//  Created by Robera Developer on 8/7/14.
//  Copyright (c) 2014 EnterWithBoldness. All rights reserved.
//
typedef NS_ENUM(NSUInteger, LoggedInOrNot){
    LoggedIn,
    NotLoggedIn
};

#import <Foundation/Foundation.h>
@class RGLoginViewController;
@interface RGLoginCoordinator : NSObject

@property NSTimer *sessionTimer;
@property UIWindow *appWindow;
@property LoggedInOrNot loginState;
@property NSInteger logOutTime;

+ (instancetype)sharedLogin;
- (void)resetTimer;

@end
