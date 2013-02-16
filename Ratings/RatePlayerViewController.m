//
//  RatePlayerViewController.m
//  Ratings
//
//  Created by Drew Stinnett on 1/15/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import "RatePlayerViewController.h"
#import "Player.h"

@interface RatePlayerViewController ()

@end

@implementation RatePlayerViewController

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
    self.title = self.player.name;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)rateAction:(UIButton *)sender {
    self.player.rating = sender.tag;
    [self.delegate ratePlayerViewController:self didPickRatingForPlayer:self.player];
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return YES;
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
