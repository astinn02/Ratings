//
//  PlayersViewController.m
//  Ratings
//
//  Created by Drew Stinnett on 1/11/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import "PlayersViewController.h"
#import "Player.h"

@interface PlayersViewController ()

@end

@implementation PlayersViewController

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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.players count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];

    // Configure the cell...
    Player *player = (self.players)[indexPath.row];
    
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
    nameLabel.text = player.name;
    UILabel *gameLabel = (UILabel *)[cell viewWithTag:101];
    gameLabel.text = player.game;
    UIImageView *ratingImageView = (UIImageView *)[cell viewWithTag:102];
    ratingImageView.image = [self imageForRating:player.rating];
    
    return cell;
    
}


- (UIImage *)imageForRating:(int)rating
{
    UIImage *myImage = nil;
    
    switch (rating)
    {
        case 1:
            myImage = [UIImage imageNamed:@"1StarSmall.png"];
            break;
        case 2:
            myImage = [UIImage imageNamed:@"2StarsSmall.png"];
            break;
        case 3:
            myImage = [UIImage imageNamed:@"3StarsSmall.png"];
            break;
        case 4:
            myImage = [UIImage imageNamed:@"4StarsSmall.png"];
            break;
        case 5:
            myImage = [UIImage imageNamed:@"5StarsSmall.png"];
            break;
    }
    return myImage;
    
        //return nil;
}
    

// Override to support conditional editing of the table view.
- (BOOL)    tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.players removeObjectAtIndex:indexPath.row]; [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
}

#pragma mark - Table view delegate

- (void)      tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

#pragma mark - PlayerDetailsViewControllerDelegate
- (void)playerDetailsViewControllerDidCancel: (PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playerDetailsViewControllerDidSave:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue
                 sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddPlayer"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        PlayerDetailsViewController *playerDetailsViewController = [navigationController viewControllers][0];
        playerDetailsViewController.delegate = self;
    }
    else if ([segue.identifier isEqualToString:@"EditPlayer"])
    {
        UINavigationController *navigationController = segue.destinationViewController;
        PlayerDetailsViewController *playerDetailsViewController = [navigationController viewControllers][0];
        playerDetailsViewController.delegate = self;
        //NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        NSIndexPath *indexPath = sender;
        Player *player = self.players[indexPath.row];
        playerDetailsViewController.playerToEdit = player; 
    }
    else if ([segue.identifier isEqualToString:@"RatePlayer"])
    {
        RatePlayerViewController *ratePlayerViewController = segue.destinationViewController;
        ratePlayerViewController.delegate = self;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        Player *player = self.players[indexPath.row];
        ratePlayerViewController.player = player;
    }
}

- (void)playerDetailsViewController: (PlayerDetailsViewController *)controller
                       didAddPlayer:(Player *)player
{
    
    [self.players addObject:player];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow: ([self.players count] - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)playerDetailsViewController: (PlayerDetailsViewController *)controller
                      didEditPlayer:(Player *)player
{
    NSUInteger index = [self.players indexOfObject:player];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)                        tableView:(UITableView *)tableView
 accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"EditPlayer" sender:indexPath];
}

#pragma mark - RatePlayerViewControllerDelegate
- (void)ratePlayerViewController: (RatePlayerViewController *)controller
          didPickRatingForPlayer:(Player *)player
{
    NSUInteger index = [self.players indexOfObject:player];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return YES;
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

















