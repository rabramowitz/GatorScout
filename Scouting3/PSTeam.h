//
//  PSTeam.h
//  GatorScout
//
//  Created by Becky Abramowitz on 3/19/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSTeam : NSObject

@property NSString *teamNumber;

// all of the information is set in the pit scouting view controller

@property NSNumber *highGoal;
@property NSNumber *lowGoal;
@property NSNumber *truss;
@property NSString *pass;
@property NSString *autoMoves;
@property NSNumber *autoScores;
@property NSNumber *autoBalls;
@property NSString *catches;
@property NSString *defense;
@property NSString *notes;

-(void)clearInfo;

@end
