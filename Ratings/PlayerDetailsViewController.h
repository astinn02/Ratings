//
//  PlayerDetailsViewController.h
//  Ratings
//
//  Created by Drew Stinnett on 1/14/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "GamePickerViewController.h"
#import "RatePlayerViewController.h"

@class PlayerDetailsViewController;

@protocol PlayerDetailsViewControllerDelegate <NSObject>

- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller;

//- (void)playerDetailsViewControllerDidSave:(PlayerDetailsViewController *)controller;

- (void)playerDetailsViewController: (PlayerDetailsViewController *)controller didAddPlayer:(Player *)player;

- (void)playerDetailsViewController: (PlayerDetailsViewController *)controller didEditPlayer:(Player *)player;

@end



@interface PlayerDetailsViewController : UITableViewController<GamePickerViewControllerDelegate,RatePlayerViewControllerDelegate>

@property (nonatomic, weak) id <PlayerDetailsViewControllerDelegate> delegate;

//@property (nonatomic, assign) int requiredRating;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (strong, nonatomic) Player *playerToEdit;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end