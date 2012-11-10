//
//  MFSideMenuViewController.h
//  EmtBus
//
//  Created by Miguel Fermin on 05/11/12.
//  Copyright (c) 2012 Miguel Fermin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXSideMenuViewController : UIViewController

@property (nonatomic, retain) NSMutableArray* viewControllers;
@property (nonatomic, retain) NSMutableArray* botones;
@property (nonatomic, retain) UIView* contentView;
@property (nonatomic, retain) UIView* menuView;
@property (nonatomic, retain) UIButton* blockView;

- (void) addViewController: (UIViewController*) controller Title:(NSString*)title Icon: (NSString*) icon;

- (void) toggleMenu;

@end
