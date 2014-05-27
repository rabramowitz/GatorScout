//
//  PSNotesViewController.h
//  Scouting3
//
//  Created by Carly Robison on 3/12/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PSTeam.h"
#import "GTBXAppDelegate.h"
#import <MessageUI/MessageUI.h>

@interface PSNotesViewController : UIViewController

@property NSString *teamNumber;

@property (weak,nonatomic) IBOutlet UITextView *notes;

@end
