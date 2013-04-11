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
        
        [self.view bringSubviewToFront:_tableView];
        
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height)];
        _contentView.backgroundColor = [UIColor grayColor];
        [self.view addSubview:_contentView];
        
        _blockView = [UIButton buttonWithType:UIButtonTypeCustom];
        _blockView.backgroundColor = [UIColor greenColor];
        _blockView.frame = CGRectMake(176, 0, 176, [UIScreen mainScreen].applicationFrame.size.height);
        [_blockView addTarget:self action:@selector(toggleMenu) forControlEvents:UIControlEventTouchUpInside];
        _blockView.backgroundColor = [UIColor clearColor];
        _blockView.hidden = YES;
        [self.view addSubview:_blockView];
        
        _images = [[NSMutableArray alloc] init];
        _titles = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.childViewControllers count];
}

- (void) addViewController: (UIViewController*) controller Title:(NSString*)title Icon: (NSString*) icon {
    
    [_titles addObject:title];    
    [_images addObject:icon];
    
    [self addChildViewController:controller];
    
    if([self.childViewControllers count] == 1)
    {
         controller.view.frame = _contentView.bounds;
        [_contentView addSubview:controller.view];
    }
    
    [_tableView reloadData];
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"MenuItemCellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString* title = (NSString*)[_titles objectAtIndex:indexPath.row];
    NSString* imageName = (NSString*)[_images objectAtIndex:indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleGray;

    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = title;
    
    
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    return cell;
}


- (void) toggleMenu {
    [UIView beginAnimations:@"Menu Slide" context:nil];
    [UIView setAnimationDuration:0.2];
    
    if(_contentView.frame.origin.x == 0) // content shown
    {
        _blockView.hidden = NO;
        CGRect newFrame = CGRectOffset(_contentView.frame, _tableView.frame.size.width, 0.0);
        _contentView.frame = newFrame;
    }
    else // content hiden
    {
        _blockView.hidden = YES;
        CGRect newFrame = CGRectOffset(_contentView.frame, -(_tableView.frame.size.width), 0.0);
        _contentView.frame = newFrame;
    }
    
    [UIView commitAnimations];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
    
    // If you are not using ARC:
    // return [[UIView new] autorelease];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if([_contentView.subviews count] == 1){
        [[_contentView.subviews objectAtIndex:0] removeFromSuperview];
    }
    
    UIViewController* controller = (UIViewController*)[self.childViewControllers objectAtIndex:indexPath.row];
    controller.view.frame = _contentView.bounds;
    [_contentView addSubview:controller.view];
    
    [self toggleMenu];
    
}
@end
