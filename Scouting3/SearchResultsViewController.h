//
//  SearchResultsViewController.h
//  Scouting3
//
//  Created by Carly Robison on 3/7/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTBXAppDelegate.h"

@interface SearchResultsViewController : UITableViewController

@property NSString *dataType;
@property NSMutableArray *resultsArr;

@end
