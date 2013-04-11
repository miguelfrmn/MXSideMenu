//
//  MFSideMenuViewController.h
//  EmtBus
//
//  Created by Miguel Fermin on 05/11/12.
//  Copyright (c) 2012 Miguel Fermin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MXSideMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) NSMutableArray* images;
@property (nonatomic, retain) NSMutableArray* titles;

@property (nonatomic, retain) UIView* contentView;
@property (nonatomic, retain) UIButton* blockView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


- (void) addViewController: (UIViewController*) controller Title:(NSString*)title Icon: (NSString*) icon;

- (void) toggleMenu;

@end
