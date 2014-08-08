//
//  UIApplication+InterceptTouch.m
//  LineAfterAfterLineBarCode
//
//  Created by Robera Developer on 8/7/14.
//  Copyright (c) 2014 EnterWithBoldness. All rights reserved.
//

#import "UIApplication+InterceptTouch.h"
#import <objc/runtime.h>
#import "RGLoginCoordinator.h"
@implementation UIApplication (InterceptTouch)

- (void)swizzledSendEvent:(UIEvent *)event{
    RGLoginCoordinator *loginCoordinator = [RGLoginCoordinator sharedLogin];
    
    NSSet *allTouches  = [event allTouches];
    if(allTouches.count > 0  && loginCoordinator.loginState == NotLoggedIn){
        //then there are touches
        NSLog(@"There are %lu nubmer of tcouhes",(unsigned long)allTouches.count);
        [loginCoordinator resetTimer];
        
    }
    [self swizzledSendEvent:event];
}


+ (void)load
{
    Method original, swizzled;
    
    original = class_getInstanceMethod(self, @selector(sendEvent:));
    swizzled = class_getInstanceMethod(self, @selector(swizzledSendEvent:));
    method_exchangeImplementations(original, swizzled);
}



@end
