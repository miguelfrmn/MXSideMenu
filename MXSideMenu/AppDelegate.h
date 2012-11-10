//
//  AppDelegate.h
//  MXSideMenu
//
//  Created by Miguel Fermin on 09/11/12.
//  Copyright (c) 2012 Miguel Fermin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXSideMenuViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MXSideMenuViewController *rootController;

@end
