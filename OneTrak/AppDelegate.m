//
//  AppDelegate.m
//  OneTrak
//
//  Created by aiuar on 07.07.17.
//  Copyright © 2017 A.V. All rights reserved.
//

#import "AppDelegate.h"
#import "AVGCalculateViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    
    // Main view controller on navigation
    AVGCalculateViewController *mainViewController = [AVGCalculateViewController new];
    UINavigationController *navMainController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
    
    self.window.rootViewController = navMainController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
