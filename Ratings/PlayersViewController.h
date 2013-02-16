//
//  PlayersViewController.h
//  Ratings
//
//  Created by Drew Stinnett on 1/11/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h"
#import "RatePlayerViewController.h"

@interface PlayersViewController : UITableViewController<PlayerDetailsViewControllerDelegate,RatePlayerViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;

@end
