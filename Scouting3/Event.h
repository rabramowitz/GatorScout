//
//  Event.h
//  GatorScout
//
//  Created by Carly Robison on 2/26/14.
//  Copyright (c) 2014 Carly Robison. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property NSString *action;
@property NSString *alliance;
@property NSNumber *matchNumber;
@property NSString *scoutName;
@property NSString *teamNumber;
@property NSDate *timestamp;
@property NSString *tournament;

@end
