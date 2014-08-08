//
//  RGLoginViewController.m
//  LineAfterAfterLineBarCode
//
//  Created by Robera Developer on 8/7/14.
//  Copyright (c) 2014 EnterWithBoldness. All rights reserved.
//

#import "RGLoginViewController.h"
#import "RGLoginCoordinator.h"
@interface RGLoginViewController ()

@end

@implementation RGLoginViewController

- (IBAction)logIn:(id)sender {
    
    //perform a check if the user has logged in, if so then reset the timer
    RGLoginCoordinator *sharedLoginCoordinator = [RGLoginCoordinator sharedLogin];
    [sharedLoginCoordinator resetTimer];
    sharedLoginCoordinator.loginState = LoggedIn;
    
    
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
