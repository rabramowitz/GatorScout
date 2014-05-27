//
//  TeamMatch.h
//  GatorScout
//
//  Created by Carly Robison on 2/26/14.
//  Copyright (c) 2014 Carly Robison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TeamMatch : NSObject

// changed in prematch view controller
@property NSString *alliance;
@property NSString *teamNumber;
@property NSNumber *matchNumber;

// auto stuff
@property int autoMadeHG;
@property int autoMadeLG;
@property int autoMissedHG;
@property int autoMissedLG;
@property BOOL autoMoved;


//teleop stuff

// implemented already
@property int teleopCaught;
@property int teleopMadeHG;
@property int teleopMadeLG;
@property int teleopMissedHG;
@property int teleopMissedLG;
@property int teleopPassed;
@property int teleopPosessions;
@property int teleopTrussMade;
@property int teleopTrussMissed;
@property int teleopDropped;

@property int teleopDefensive;
@property BOOL broken;
@property int penalties;

@property NSString *notes;
@property NSString *tournamentName;
@property NSString *scoutName;

@property NSDate *timestamp;

 - (void)clearInfo;

@end
