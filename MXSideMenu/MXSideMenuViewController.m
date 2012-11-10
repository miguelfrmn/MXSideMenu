//
//  MFSideMenuViewController.m
//  EmtBus
//
//  Created by Miguel Fermin on 05/11/12.
//  Copyright (c) 2012 Miguel Fermin. All rights reserved.
//

#import "MXSideMenuViewController.h"

@interface MXSideMenuViewController ()

@end

@implementation MXSideMenuViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _menuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 176, self.view.bounds.size.height)];
        [self.view addSubview:_menuView];
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        _contentView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_contentView];
        
        _blockView = [UIButton buttonWithType:UIButtonTypeCustom];
        _blockView.frame = CGRectMake(176, 0, 176, self.view.bounds.size.height);
        [_blockView addTarget:self action:@selector(toggleMenu) forControlEvents:UIControlEventTouchUpInside];
        _blockView.backgroundColor = [UIColor clearColor];
        _blockView.hidden = YES;
        [self.view addSubview:_blockView];
        
       

        _botones = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void) addViewController: (UIViewController*) controller Title:(NSString*)title Icon: (NSString*) icon {
    
    UIImageView *divider = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_divider.png"]];
    divider.frame = CGRectMake(0, 0 + (45 * [self.childViewControllers count]),176,2);
    [_menuView addSubview:divider];
    
    UIImageView *icono = [[UIImageView alloc] initWithImage:[UIImage imageNamed:icon]];
    icono.frame = CGRectMake(10, 12 + (45 * [self.childViewControllers count]),25,25);
    [_menuView addSubview:icono];
    
    UITextView* titulo = [[UITextView alloc] initWithFrame:CGRectMake(35, 5 + (45 * [self.childViewControllers count]), 100, 30)];
    titulo.text = title;
    titulo.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:18];
    titulo.textColor = [UIColor whiteColor];
    titulo.backgroundColor = [UIColor clearColor];
    [_menuView addSubview:titulo];

    UIButton *boton = [UIButton buttonWithType:UIButtonTypeCustom];
    boton.frame = CGRectMake(0, 3 + (45 * [self.childViewControllers count]), 176, 42);
    [boton setBackgroundImage:[UIImage imageNamed:@"btn_selected_bg.png"] forState:UIControlStateHighlighted];
    [boton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [_botones addObject:boton];
    [_menuView addSubview:boton];
    
    [self addChildViewController:controller];
    
    if([self.childViewControllers count] == 1)
    {
        [_contentView addSubview:controller.view];
    } 
    
   
    
}

- (void) toggleMenu {
    [UIView beginAnimations:@"Menu Slide" context:nil];
    [UIView setAnimationDuration:0.2];
    
    if(_contentView.frame.origin.x == 0)
    {
        _blockView.hidden = NO;
        CGRect newFrame = CGRectOffset(_contentView.frame, _menuView.frame.size.width, 0.0);
        _contentView.frame = newFrame;
    }
    else
    {
        _blockView.hidden = YES;
        CGRect newFrame = CGRectOffset(_contentView.frame, -(_menuView.frame.size.width), 0.0);
        _contentView.frame = newFrame;
    }
    
    [UIView commitAnimations];
}

-(void) buttonTapped:(id)sender {
    
    int index = [_botones indexOfObject:sender];
    
    if([_contentView.subviews count] == 1){
        [[_contentView.subviews objectAtIndex:0] removeFromSuperview];
    }
    
    UIViewController* controller = (UIViewController*)[self.childViewControllers objectAtIndex:index];
    
    controller.view.frame = _contentView.bounds;
    
    [_contentView addSubview:controller.view];
       
    [self toggleMenu];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)viewDidUnload {
        
    [super viewDidUnload];
   
}
@end
