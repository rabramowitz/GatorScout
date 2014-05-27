//
//  PSTeam.m
//  GatorScout
//
//  Created by Becky Abramowitz on 3/19/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import "PSTeam.h"

@implementation PSTeam

-(void) clearInfo{
    self.teamNumber = @"";
    self.highGoal = 0;
    self.lowGoal = 0;
    self.truss = 0;
    self.pass = 0;
    self.autoMoves = 0;
    self.autoScores = 0;
    self.autoBalls = 0;
    self.catches = 0;
    self.defense = 0;
    self.notes = @"";
}

@end
