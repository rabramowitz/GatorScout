//
//  PreMatchViewController.m
//  Scouting
//
//  Created by Becky Abramowitz on 2/28/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import "PreMatchViewController.h"

@interface PreMatchViewController ()

@end

@implementation PreMatchViewController {
    int oldMatch;
}

GTBXAppDelegate *appDelegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    appDelegate = (GTBXAppDelegate*) [[UIApplication sharedApplication] delegate];
    oldMatch = appDelegate.currentMatchNumber;
    self.matchValue.text = [NSString stringWithFormat:@"%d", oldMatch];
    _matchStepper.minimumValue = -oldMatch;
    //set intial team values
    self.teamOne.text = appDelegate.team1stats.teamNumber;
    self.teamTwo.text = appDelegate.team2stats.teamNumber;
    self.teamThree.text = appDelegate.team3stats.teamNumber;
    if ([appDelegate.team1stats.alliance isEqual: @"blue"]) {
        self.allianceSelector.selectedSegmentIndex = 1;
    }
    else {
        self.allianceSelector.selectedSegmentIndex = 0;
        appDelegate.alliance = @"red";
    }
    
    // NOTE. CLEAR THESE VALUES WHEN YOU REACH SUMMARY (set everything to @"")
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([appDelegate.team1stats.teamNumber isEqual:@""]) {
        appDelegate.team1stats.teamNumber = @"0";
    }
    if ([appDelegate.team2stats.teamNumber isEqual:@""]) {
        appDelegate.team2stats.teamNumber = @"0";
    }
    if ([appDelegate.team3stats.teamNumber isEqual:@""]) {
        appDelegate.team3stats.teamNumber = @"0";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)stepperChanged:(UIStepper *)matchStepper {
    appDelegate.currentMatchNumber = oldMatch + matchStepper.value;
    self.matchValue.text = [NSString stringWithFormat:@"%d", appDelegate.currentMatchNumber];
    NSNumber *matchNum = [NSNumber numberWithInt:appDelegate.currentMatchNumber];
    appDelegate.team1stats.matchNumber = matchNum;
    appDelegate.team2stats.matchNumber = matchNum;
    appDelegate.team3stats.matchNumber = matchNum;
}

- (IBAction)allianceChanged:(UISegmentedControl *)allianceSelector {
    if (self.allianceSelector.selectedSegmentIndex == 1) {
        appDelegate.alliance = @"blue";
        appDelegate.team1stats.alliance = @"blue";
        appDelegate.team2stats.alliance = @"blue";
        appDelegate.team3stats.alliance = @"blue";
    }
    else {
        appDelegate.alliance = @"red";
        appDelegate.team1stats.alliance = @"red";
        appDelegate.team2stats.alliance = @"red";
        appDelegate.team3stats.alliance = @"red";
    }
}

- (IBAction)textChanged:(UITextField *)sender {
    appDelegate.team1stats.teamNumber = self.teamOne.text;
    appDelegate.team2stats.teamNumber = self.teamTwo.text;
    appDelegate.team3stats.teamNumber = self.teamThree.text;
}

- (IBAction)removeKeyboard:(id)sender {
    [self.teamOne resignFirstResponder];
    [self.teamTwo resignFirstResponder];
    [self.teamThree resignFirstResponder];
}

@end
