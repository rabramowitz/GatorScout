//
//  AppDelegate.h
//  GatorScout
//
//  Created by Carly Robison on 2/26/14.
//  Copyright (c) 2014 Carly Robison. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

// for Core Data purposes
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator ;

@property (strong, nonatomic) UIWindow *window;

// to be shared
@property int currentMatchNumber;
@property NSString *alliance;
@property NSString *scoutName;
@property NSString *team1;
@property NSString *team2;
@property NSString *team3;

@end
