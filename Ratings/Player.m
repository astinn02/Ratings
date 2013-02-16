//
//  Player.m
//  Ratings
//
//  Created by Drew Stinnett on 1/11/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import "Player.h"

@implementation Player
- (BOOL)shouldAutorotateToInterfaceOrientation: (UIInterfaceOrientation)interfaceOrientation
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return YES;
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
@end
