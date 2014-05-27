//
//  PreMatchViewController.h
//  Scouting
//
//  Created by Becky Abramowitz on 2/28/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTBXAppDelegate.h"

@interface PreMatchViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIStepper *matchStepper;
@property (weak, nonatomic) IBOutlet UILabel *matchValue;
@property (weak, nonatomic) IBOutlet UISegmentedControl *allianceSelector;
@property (weak, nonatomic) IBOutlet UITextField *teamOne;
@property (weak, nonatomic) IBOutlet UITextField *teamTwo;
@property (weak, nonatomic) IBOutlet UITextField *teamThree;

- (IBAction)stepperChanged:(UIStepper *)matchStepper;
- (IBAction)allianceChanged:(UISegmentedControl *)allianceSelector;
- (IBAction)textChanged:(UITextField *)sender;


@end
