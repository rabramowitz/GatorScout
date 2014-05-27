//
//  SummaryViewController.h
//  Scouting3
//
//  Created by Becky Abramowitz on 3/8/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>

@interface SummaryViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *matchLabel;

@property (weak, nonatomic) IBOutlet UILabel *team1Label;
@property (weak, nonatomic) IBOutlet UILabel *team2Label;
@property (weak, nonatomic) IBOutlet UILabel *team3Label;

@property (weak, nonatomic) IBOutlet UILabel *team1Possession;
@property (weak, nonatomic) IBOutlet UILabel *team2Possession;
@property (weak, nonatomic) IBOutlet UILabel *team3Possession;

@property (weak, nonatomic) IBOutlet UILabel *team1HGMade;
@property (weak, nonatomic) IBOutlet UILabel *team2HGMade;
@property (weak, nonatomic) IBOutlet UILabel *team3HGMade;

@property (weak, nonatomic) IBOutlet UILabel *team1HGAttempted;
@property (weak, nonatomic) IBOutlet UILabel *team2HGAttempted;
@property (weak, nonatomic) IBOutlet UILabel *team3HGAttempted;

@property (weak, nonatomic) IBOutlet UILabel *team1LGMade;
@property (weak, nonatomic) IBOutlet UILabel *team2LGMade;
@property (weak, nonatomic) IBOutlet UILabel *team3LGMade;

@property (weak, nonatomic) IBOutlet UILabel *team1LGAttempted;
@property (weak, nonatomic) IBOutlet UILabel *team2LGAttempted;
@property (weak, nonatomic) IBOutlet UILabel *team3LGAttempted;

@property (weak, nonatomic) IBOutlet UILabel *team1HGMadeA;
@property (weak, nonatomic) IBOutlet UILabel *team2HGMadeA;
@property (weak, nonatomic) IBOutlet UILabel *team3HGMadeA;

@property (weak, nonatomic) IBOutlet UILabel *team1HGAttemptedA;
@property (weak, nonatomic) IBOutlet UILabel *team2HGAttemptedA;
@property (weak, nonatomic) IBOutlet UILabel *team3HGAttemptedA;

@property (weak, nonatomic) IBOutlet UILabel *team1LGMadeA;
@property (weak, nonatomic) IBOutlet UILabel *team2LGMadeA;
@property (weak, nonatomic) IBOutlet UILabel *team3LGMadeA;

@property (weak, nonatomic) IBOutlet UILabel *team1LGAttemptedA;
@property (weak, nonatomic) IBOutlet UILabel *team2LGAttemptedA;
@property (weak, nonatomic) IBOutlet UILabel *team3LGAttemptedA;


@property (weak, nonatomic) IBOutlet UILabel *team1movedA;
@property (weak, nonatomic) IBOutlet UILabel *team2movedA;
@property (weak, nonatomic) IBOutlet UILabel *team3movedA;

@property (weak, nonatomic) IBOutlet UILabel *team1broke;
@property (weak, nonatomic) IBOutlet UILabel *team2broke;
@property (weak, nonatomic) IBOutlet UILabel *team3broke;


@property (weak, nonatomic) IBOutlet UILabel *team1Truss;
@property (weak, nonatomic) IBOutlet UILabel *team2Truss;
@property (weak, nonatomic) IBOutlet UILabel *team3Truss;

@property (weak, nonatomic) IBOutlet UILabel *team1trussMiss;
@property (weak, nonatomic) IBOutlet UILabel *team2TrussMiss;
@property (weak, nonatomic) IBOutlet UILabel *team3TrussMiss;

@property (weak, nonatomic) IBOutlet UILabel *team1Catch;
@property (weak, nonatomic) IBOutlet UILabel *team2Catch;
@property (weak, nonatomic) IBOutlet UILabel *team3Catch;

@end
