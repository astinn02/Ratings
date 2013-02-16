//
//  GamePickerViewController.m
//  Ratings
//
//  Created by Drew Stinnett on 1/14/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import "GamePickerViewController.h"

@interface GamePickerViewController ()
{
    NSArray *_games;
    NSUInteger _selectedIndex;

}
@end

@implementation GamePickerViewController

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
    
    _games = @[@"Angry Birds",
                @"Chess",
                @"Russian Roulette",
                @"Spin the Bottle",
                @"Texas Hold'em Poker",
                @"Tic-Tac-Toe",
                @"Tennis"];
    _selectedIndex = [_games indexOfObject:self.game];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_games count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:@"GameCell"]; cell.textLabel.text = _games[indexPath.row];
    if (indexPath.row == _selectedIndex)
        cell.accessoryType = UITableViewCellAccessoryCheckmark; else
            cell.accessoryType = UITableViewCellAccessoryNone;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_selectedIndex != NSNotFound) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath
                                                                  indexPathForRow:_selectedIndex inSection:0]]; cell.accessoryType = UITableViewCellAccessoryNone;
    }
    _selectedIndex = indexPath.row; UITableViewCell *cell = [tableView
                                                             cellForRowAtIndexPath:indexPath]; cell.accessoryType = UITableViewCellAccessoryCheckmark;
    NSString *game = _games[indexPath.row]; [self.delegate gamePickerViewController:self didSelectGame:game];
}

- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return YES;
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
