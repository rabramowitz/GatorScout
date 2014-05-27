//
//  TeleopViewController.h
//  GatorScout
//
//  Created by Carly Robison on 2/27/14.
//  Copyright (c) 2014 Carly Robison. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Event.h"
#import "TeamMatch.h"

@interface TeleopViewController : UIViewController

@property int score;
@property NSString *currentTeam;

@property (weak, nonatomic) IBOutlet UIButton *firstTeamButton;
@property (weak, nonatomic) IBOutlet UIButton *secondTeamButton;
@property (weak, nonatomic) IBOutlet UIButton *thirdTeamButton;
@property (weak, nonatomic) IBOutlet UILabel *reportActionLabel;
@property (weak, nonatomic) IBOutlet UILabel *matchLabel;
@property (weak, nonatomic) IBOutlet UIButton *firstTeamDefense;
@property (weak, nonatomic) IBOutlet UIButton *secondTeamDefense;
@property (weak, nonatomic) IBOutlet UIButton *thirdTeamDefense;
@property (weak, nonatomic) IBOutlet UIButton *firstTeamNoShow;
@property (weak, nonatomic) IBOutlet UIButton *secondTeamNoShow;
@property (weak, nonatomic) IBOutlet UIButton *thirdTeamNoShow;
@property (weak, nonatomic) IBOutlet UIButton *firstTeamPenalty;
@property (weak, nonatomic) IBOutlet UIButton *secondTeamPenalty;
@property (weak, nonatomic) IBOutlet UIButton *thirdTeamPenalty;

- (IBAction)teamSelected:(id)sender; //
- (IBAction)passed:(id)sender; //
- (IBAction)caught:(id)sender; //
- (IBAction)highGoalMade:(id)sender; //
- (IBAction)highGoalMissed:(id)sender; //
- (IBAction)lowGoalMade:(id)sender; //
- (IBAction)lowGoalMissed:(id)sender; //
- (IBAction)trussMade:(id)sender; //
- (IBAction)trussMissed:(id)sender; //
- (IBAction)dropped:(id)sender; //

- (IBAction)team1defense:(id)sender;
- (IBAction)team2defense:(id)sender;
- (IBAction)team3defense:(id)sender;

- (IBAction)team1penalty:(id)sender;
- (IBAction)team2penalty:(id)sender;
- (IBAction)team3penalty:(id)sender;

- (IBAction)team1broken:(id)sender;
- (IBAction)team2broken:(id)sender;
- (IBAction)team3broken:(id)sender;


@end
