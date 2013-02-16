//
//  RatePlayerViewController.h
//  Ratings
//
//  Created by Drew Stinnett on 1/15/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RatePlayerViewController;
@class Player;

@protocol RatePlayerViewControllerDelegate <NSObject>

- (void)ratePlayerViewController:(RatePlayerViewController *)controller didPickRatingForPlayer:(Player *)player;

@end

@interface RatePlayerViewController : UIViewController

@property (nonatomic, weak) id <RatePlayerViewControllerDelegate> delegate;

@property (nonatomic, strong) Player *player;

- (IBAction)rateAction:(UIButton *)sender;

@end