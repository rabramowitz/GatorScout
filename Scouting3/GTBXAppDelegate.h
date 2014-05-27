//
//  GTBXAppDelegate.h
//  Scouting3
//
//  Created by Becky Abramowitz on 3/4/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

// github now working?

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "SettingsViewController.h"
#import "PreMatchViewController.h"
#import "TeamMatch.h"
#import "PSTeam.h"

@interface GTBXAppDelegate : UIResponder <UIApplicationDelegate>

// for Core Data purposes
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator ;

@property (strong, nonatomic) UIWindow *window;

// to be shared
@property int currentMatchNumber;
@property NSString *alliance;
@property NSString *scoutName;
@property NSString *tournamentName;

@property BOOL sendEmailData;
@property BOOL savePhotos;
@property BOOL keepMeSafe;

@property TeamMatch *team1stats;
@property TeamMatch *team2stats;
@property TeamMatch *team3stats;

@property PSTeam *teamPitStats;

@property NSMutableArray *searchResults;

@property NSString *scoutingEmail;

@end
