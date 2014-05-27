//
//  AutonomousViewController.h
//  Scouting3
//
//  Created by Becky Abramowitz on 3/8/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AutonomousViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *matchNumber;
@property (weak, nonatomic) IBOutlet UILabel *teamOneLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamTwoLabel;
@property (weak, nonatomic) IBOutlet UILabel *teamThreeLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

- (IBAction)team1Moved:(id)sender;
- (IBAction)team1MadeHG:(id)sender;
- (IBAction)team1MissedHG:(id)sender;
- (IBAction)team1MadeLG:(id)sender;
- (IBAction)team1MissedLG:(id)sender;

- (IBAction)team2Moved:(id)sender;
- (IBAction)team2MadeHG:(id)sender;
- (IBAction)team2MissedHG:(id)sender;
- (IBAction)team2MadeLG:(id)sender;
- (IBAction)team2MissedLG:(id)sender;

- (IBAction)team3Moved:(id)sender;
- (IBAction)team3MadeHG:(id)sender;
- (IBAction)team3MissedHG:(id)sender;
- (IBAction)team3MadeLG:(id)sender;
- (IBAction)team3MissedLG:(id)sender;


@end
