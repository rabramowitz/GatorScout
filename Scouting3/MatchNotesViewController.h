//
//  MatchNotesViewController.h
//  GatorScout
//
//  Created by Becky Abramowitz on 3/27/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTBXAppDelegate.h"

@interface MatchNotesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *teamSelector;

@property (weak, nonatomic) IBOutlet UITextView *notesField;

-(IBAction)teamChanged:(UISegmentedControl *)teamSelector;

@end
