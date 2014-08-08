//
//  RGAppDelegate.m
//  LineAfterAfterLineBarCode
//
//  Created by Robera Developer on 8/7/14.
//  Copyright (c) 2014 EnterWithBoldness. All rights reserved.
//

#import "RGAppDelegate.h"
#import "RGLoginCoordinator.h"
@interface RGAppDelegate()

@property UILocalNotification *sessionExpiredNotification;
@end


@implementation RGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    RGLoginCoordinator *sharedCoordinator = [RGLoginCoordinator sharedLogin];
    sharedCoordinator.appWindow = self.window;
    
    /**we set the expiration Time(i'll do it manually here(60 secs), if this was for real i'd use the users set data and
     use a default time in the mean time(no pun inteded)
     **/
    sharedCoordinator.logOutTime = 10;
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    //get the timer and schedule the notification if the user happens to time out
    self.sessionExpiredNotification = [[UILocalNotification alloc]init];
    self.sessionExpiredNotification.alertBody = @"Your Session has Expired";
    //get the time the the session should expire
    NSDate *fireDate = [RGLoginCoordinator sharedLogin].sessionTimer.fireDate;
    self.sessionExpiredNotification.fireDate = fireDate;
    [[UIApplication sharedApplication] scheduleLocalNotification:self.sessionExpiredNotification];
    
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    //essentially invalidate the notification
    self.sessionExpiredNotification.fireDate = nil;
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
