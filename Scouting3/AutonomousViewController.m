//
//  AutonomousViewController.m
//  Scouting3
//
//  Created by Becky Abramowitz on 3/8/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import "AutonomousViewController.h"
#import "GTBXAppDelegate.h"

@interface AutonomousViewController ()

@end

@implementation AutonomousViewController

GTBXAppDelegate *appDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    appDelegate = (GTBXAppDelegate*) [[UIApplication sharedApplication] delegate];
    
    if ([appDelegate.alliance isEqual: @"red"]) {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"redbackground.png"]]];
    }
    else {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bluebackground.png"]]];
    }
    
    self.teamOneLabel.text = appDelegate.team1stats.teamNumber;
    self.teamTwoLabel.text = appDelegate.team2stats.teamNumber;
    self.teamThreeLabel.text = appDelegate.team3stats.teamNumber;
    self.matchNumber.text = [[NSString alloc] initWithFormat: @"%d", appDelegate.currentMatchNumber];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)team1Moved:(id)sender {
    if ([sender isSelected]) {
        appDelegate.team1stats.autoMoved = FALSE;
        [sender setSelected:FALSE];
        self.statusLabel.text = [NSString stringWithFormat:@"Team %@ moved revoked", appDelegate.team1stats.teamNumber];
    } else {
        appDelegate.team1stats.autoMoved = TRUE;
        [sender setSelected:TRUE];
        self.statusLabel.text = [NSString stringWithFormat:@"Team %@ moved", appDelegate.team1stats.teamNumber];
    }
}
- (IBAction)team1MadeHG:(id)sender{
    appDelegate.team1stats.autoMadeHG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ made high goal", self.teamOneLabel.text];
}
- (IBAction)team1MissedHG:(id)sender{
    appDelegate.team1stats.autoMissedHG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ missed high goal", self.teamOneLabel.text];
}
- (IBAction)team1MadeLG:(id)sender{
    appDelegate.team1stats.autoMadeLG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ made low goal", self.teamOneLabel.text];
}
- (IBAction)team1MissedLG:(id)sender{
    appDelegate.team1stats.autoMissedLG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ missed low goal", self.teamOneLabel.text];
}

- (IBAction)team2Moved:(id)sender{
    if ([sender isSelected]) {
        appDelegate.team2stats.autoMoved = FALSE;
        [sender setSelected:FALSE];
        self.statusLabel.text = [NSString stringWithFormat:@"Team %@ moved revoked", appDelegate.team2stats.teamNumber];
    } else {
        appDelegate.team2stats.autoMoved = TRUE;
        [sender setSelected:TRUE];
        self.statusLabel.text = [NSString stringWithFormat:@"Team %@ moved", appDelegate.team2stats.teamNumber];
    }
}
- (IBAction)team2MadeHG:(id)sender{
    appDelegate.team2stats.autoMadeHG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ made high goal", self.teamTwoLabel.text];
}
- (IBAction)team2MissedHG:(id)sender{
    appDelegate.team2stats.autoMissedHG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ missed high goal", self.teamTwoLabel.text];
}
- (IBAction)team2MadeLG:(id)sender{
    appDelegate.team2stats.autoMadeLG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ made low goal", self.teamTwoLabel.text];
}
- (IBAction)team2MissedLG:(id)sender{
    appDelegate.team2stats.autoMissedLG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ missed low goal", self.teamTwoLabel.text];
}

- (IBAction)team3Moved:(id)sender{
    if ([sender isSelected]) {
        appDelegate.team3stats.autoMoved = FALSE;
        [sender setSelected:FALSE];
        self.statusLabel.text = [NSString stringWithFormat:@"Team %@ moved revoked", appDelegate.team3stats.teamNumber];
    } else {
        appDelegate.team3stats.autoMoved = TRUE;
        [sender setSelected:TRUE];
        self.statusLabel.text = [NSString stringWithFormat:@"Team %@ moved", appDelegate.team3stats.teamNumber];
    }
}
- (IBAction)team3MadeHG:(id)sender{
    appDelegate.team3stats.autoMadeHG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ made high goal", self.teamThreeLabel.text];
}
- (IBAction)team3MissedHG:(id)sender{
    appDelegate.team3stats.autoMissedHG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ missed high goal", self.teamThreeLabel.text];
}
- (IBAction)team3MadeLG:(id)sender{
    appDelegate.team3stats.autoMadeLG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ made low goal", self.teamThreeLabel.text];
}
- (IBAction)team3MissedLG:(id)sender{
    appDelegate.team3stats.autoMissedLG +=1;
    self.statusLabel.text = [NSString stringWithFormat:@"Team %@ missed low goal", self.teamThreeLabel.text];
}
@end
