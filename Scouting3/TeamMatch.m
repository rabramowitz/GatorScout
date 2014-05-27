//
//  TeamMatch.m
//  GatorScout
//
//  Created by Carly Robison on 2/26/14.
//  Copyright (c) 2014 Carly Robison. All rights reserved.
//

#import "TeamMatch.h"

@implementation TeamMatch

-(void)clearInfo {
    self.teamNumber = @"";
    self.autoMadeHG = 0;
    self.autoMadeLG = 0;
    self.autoMissedHG = 0;
    self.autoMissedLG = 0;
    self.autoMoved = FALSE;
    
    self.teleopDefensive = 0;
    self.broken = FALSE;
    self.penalties = 0;

    self.teleopCaught = 0;
    self.teleopMadeHG = 0;
    self.teleopMadeLG = 0;
    self.teleopMissedHG = 0;
    self.teleopMissedLG = 0;
    self.teleopPassed = 0;
    self.teleopPosessions = 0;
    self.teleopTrussMade = 0;
    self.teleopTrussMissed = 0;
    self.teleopDropped = 0;
    self.notes = @"";
}

@end
