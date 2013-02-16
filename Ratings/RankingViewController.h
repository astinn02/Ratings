//
//  RankingViewController.h
//  Ratings
//
//  Created by Drew Stinnett on 1/15/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatePlayerViewController.h"
@interface RankingViewController : UITableViewController <RatePlayerViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *rankedPlayers;
@property (nonatomic, assign) int requiredRating;

- (IBAction)done:(id)sender;

@end