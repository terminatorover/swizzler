//
//  RGLoginCoordinator.h
//  LineAfterAfterLineBarCode
//
//  Created by Robera Developer on 8/7/14.
//  Copyright (c) 2014 EnterWithBoldness. All rights reserved.
//

#import <Foundation/Foundation.h>
@class RGLoginViewController;
@interface RGLoginCoordinator : NSObject

@property NSTimer *sessionTimer;
@property UIWindow *appWindow;


+ (instancetype)sharedLogin;
- (void)resetTimer;

@end
