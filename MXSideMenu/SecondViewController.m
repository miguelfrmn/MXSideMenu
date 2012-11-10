//
//  SecondViewController.m
//  MXSideMenu
//
//  Created by Miguel Fermin on 09/11/12.
//  Copyright (c) 2012 Miguel Fermin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleMenu:(id)sender {
    if([self.parentViewController respondsToSelector:@selector(toggleMenu)]){
        [self.parentViewController performSelector:@selector(toggleMenu)];
    }
}
@end
