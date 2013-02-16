//
//  DetailViewController.m
//  Ratings
//
//  Created by Drew Stinnett on 1/17/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
{
    UIPopoverController *_masterPopoverController;
    UIPopoverController *_menuPopoverController;
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return YES;
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowPopover"])
    {
        if (_menuPopoverController != nil && _menuPopoverController.popoverVisible)
        {
            [_menuPopoverController dismissPopoverAnimated:NO];
        }
        _menuPopoverController = ((UIStoryboardPopoverSegue *)segue).popoverController;
        _menuPopoverController.delegate = self;
    }
}


- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration
{
    if (_menuPopoverController != nil && _menuPopoverController.popoverVisible)
    {
        [_menuPopoverController dismissPopoverAnimated:YES];
        _menuPopoverController = nil;
    }
}


#pragma mark - UIPopoverControllerDelegate
- (void)popoverControllerDidDismissPopover: (UIPopoverController *)popoverController
{
    _menuPopoverController.delegate = nil;
    _menuPopoverController = nil;
}


#pragma mark - UISplitViewControllerDelegate
- (void)splitViewController: (UISplitViewController *)splitViewController
     willHideViewController:(UIViewController *)viewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = @"Master";
    NSMutableArray *items = [[self.toolbar items] mutableCopy]; [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES]; _masterPopoverController = popoverController;
}
- (void)splitViewController:(UISplitViewController *)splitController
     willShowViewController:(UIViewController *)viewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    NSMutableArray *items = [[self.toolbar items] mutableCopy]; [items removeObject:barButtonItem];
    [self.toolbar setItems:items animated:YES]; _masterPopoverController = nil;
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

@end
