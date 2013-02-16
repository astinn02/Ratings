//
//  RankingViewController.m
//  Ratings
//
//  Created by Drew Stinnett on 1/15/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import "RankingViewController.h"
#import "Player.h"

@interface RankingViewController ()

@end

@implementation RankingViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Player *player = self.rankedPlayers[indexPath.row];
    
    [self performSegueWithIdentifier:@"RatePlayer" sender:player];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"RatePlayer"])
    {
        RatePlayerViewController *ratePlayerViewController = segue.destinationViewController;
        ratePlayerViewController.delegate = self;
        ratePlayerViewController.player = sender;
    }
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.rankedPlayers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:CellIdentifier];
        Player *player = self.rankedPlayers[indexPath.row]; cell.textLabel.text = player.name; cell.detailTextLabel.text = player.game;
        return cell;
    }
}

- (IBAction)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - RatePlayerViewControllerDelegate
- (void)ratePlayerViewController: (RatePlayerViewController *)controller didPickRatingForPlayer:(Player *)player
{
    if (player.rating != self.requiredRating)
    {
        NSUInteger index = [self.rankedPlayers indexOfObject:player];
        [self.rankedPlayers removeObjectAtIndex:index];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return YES;
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end





























