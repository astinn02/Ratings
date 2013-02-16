//
//  GesturesViewController.h
//  Ratings
//
//  Created by Drew Stinnett on 1/11/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GesturesViewController : UIViewController

@property (nonatomic, strong) IBOutlet UISwipeGestureRecognizer *swipeGestureRecognizer;
@property (nonatomic, strong) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;
@property (nonatomic, strong) NSArray *players;

@end