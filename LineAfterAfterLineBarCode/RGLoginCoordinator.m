//
//  RGLoginCoordinator.m
//  LineAfterAfterLineBarCode
//
//  Created by Robera Developer on 8/7/14.
//  Copyright (c) 2014 EnterWithBoldness. All rights reserved.
//

#import "RGLoginCoordinator.h"
#import "RGLoginViewController.h"

@interface RGLoginCoordinator ()<UIAlertViewDelegate>

@end

@implementation RGLoginCoordinator

#pragma mark - singelton
+ (instancetype)sharedLogin {
    static RGLoginCoordinator *_sharedLogin = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedLogin = [[RGLoginCoordinator alloc]init];
        
    });
    
    return _sharedLogin;
}

- (void)setTimer{
    [self resetTimer];
}

- (void)resetTimer{
    [self.sessionTimer invalidate];
    _sessionTimer = [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(timeExpired) userInfo:nil repeats:NO];
}


- (void)timeExpired{
      //fires when the user's session has expired.
      UIAlertView *alertMessage = [ [UIAlertView alloc]
                                     initWithTitle:@"Session Expired"
                                     message:@"Your session has expried ! Now get out :)"
                                     delegate:self
                                     cancelButtonTitle:@"Ok"
                                   otherButtonTitles:nil
                                     ];
        [alertMessage show];

    
   
}

#pragma mark - Alert View Delegate 
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //now we know the user has tapped ok regarding the session expiring so we take them to the login VC
    //first get the storyboard
    UIStoryboard *mainIphoneStoryBoard = [ UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    //create the login View COntroller with the given nib
    RGLoginViewController *loginViewController = (RGLoginViewController *) [mainIphoneStoryBoard  instantiateViewControllerWithIdentifier:@"LoginVC"];
    //create a nav View Controller to scafold the login view Controller and make it the root VC
    UINavigationController *navigationViewController = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    
    self.appWindow.rootViewController = navigationViewController;
    

}


@end
