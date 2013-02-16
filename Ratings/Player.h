//
//  Player.h
//  Ratings
//
//  Created by Drew Stinnett on 1/11/13.
//  Copyright (c) 2013 T3. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) int rating;

@end
