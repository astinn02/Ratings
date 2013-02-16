//
//  PlayerDetailsViewController.m
//  Ratings
//
//  Created by Drew Stinnett on 1/14/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import "PlayerDetailsViewController.h"


@interface PlayerDetailsViewController ()

@end

@implementation PlayerDetailsViewController
{
    NSString *_game;
}

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
    
    if (self.playerToEdit != nil)
    {
        
        self.title = @"Edit Player";
        self.nameTextField.text = self.playerToEdit.name;
        _game = self.playerToEdit.game;
        
    }
    
    self.detailLabel.text = _game;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    if (indexPath.section == 0)
        [self.nameTextField becomeFirstResponder];
    
}

- (IBAction)cancel:(id)sender
{
    [self.delegate playerDetailsViewControllerDidCancel:self];
}

- (IBAction)done:(id)sender {
    
    if (self.playerToEdit != nil) {
        self.playerToEdit.name = self.nameTextField.text; self.playerToEdit.game = _game;
        [self.delegate playerDetailsViewController:self didEditPlayer:self.playerToEdit];
    }
    else
    {
    
    Player *player = [[Player alloc] init];
    player.name = self.nameTextField.text;
    player.game = _game;
    player.rating = 1;
    [self.delegate playerDetailsViewController:self didAddPlayer:player];
    }
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder]))
    {
        NSLog(@"init PlayerDetailsViewController");
        _game = @"Chess";
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"dealloc PlayerDetailsViewController");
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickGame"])
    {
        GamePickerViewController *gamePickerViewController = segue.destinationViewController;
        gamePickerViewController.delegate = self;
        gamePickerViewController.game = _game;
    }
    else if ([segue.identifier isEqualToString:@"RatePlayer"])
    {
        
        RatePlayerViewController *ratePlayerViewController = segue.destinationViewController;
        ratePlayerViewController.delegate = self;
        
        //not sure about this next line:
        ratePlayerViewController.player = self.playerToEdit;
    }
}
#pragma mark - RatePlayerViewControllerDelegate
- (void)ratePlayerViewController: (RatePlayerViewController *)controller didPickRatingForPlayer:(Player *)player
{
//    if (player.rating != self.requiredRating)
//    {
        //already have the player so don't need the following 4 lines of code:
//        NSUInteger index = [self.rankedPlayers indexOfObject:player];
//        [self.rankedPlayers removeObjectAtIndex:index];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
//        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)gamePickerViewController: (GamePickerViewController *)controller didSelectGame:(NSString *)game
{
    _game = game;
    self.detailLabel.text = _game;
    [self.navigationController popViewControllerAnimated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return YES;
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


@end









