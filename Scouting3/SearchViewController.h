//
//  SearchViewController.h
//  Scouting3
//
//  Created by Carly Robison on 3/6/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTBXAppDelegate.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface SearchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *teamNumberField;
@property (weak, nonatomic) IBOutlet UITextField *matchNumberField;
- (IBAction)clearData:(id)sender;

@property NSMutableArray *results;

@end
