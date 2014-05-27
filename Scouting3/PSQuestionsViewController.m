//
//  PSQuestionsViewController.m
//  Scouting3
//
//  Created by Becky Abramowitz on 3/7/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import "PSQuestionsViewController.h"
#import "PSNotesViewController.h"
#import "GTBXAppDelegate.h"

@interface PSQuestionsViewController ()

@end

@implementation PSQuestionsViewController {
}

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
    self.teamNumber.text = appDelegate.teamPitStats.teamNumber;
    if (appDelegate.teamPitStats.highGoal > 0) {
        self.topGoalSlider.value = [appDelegate.teamPitStats.highGoal floatValue];
        self.topGoalLabel.text = [NSString stringWithFormat:@"%@%@",appDelegate.teamPitStats.highGoal, @"%"];
    }
    if (appDelegate.teamPitStats.lowGoal > 0) {
        self.lowGoalSlider.value = [appDelegate.teamPitStats.lowGoal floatValue];
        self.lowGoalLabel.text = [NSString stringWithFormat:@"%@%@",appDelegate.teamPitStats.lowGoal, @"%"];
    }
    if (appDelegate.teamPitStats.truss > 0) {
        self.trussSlider.value = [appDelegate.teamPitStats.truss floatValue];
        self.trussLabel.text = [NSString stringWithFormat:@"%@%@", appDelegate.teamPitStats.truss, @"%"];
    }
    if ([appDelegate.teamPitStats.pass isEqual: @"yes"]) {
        self.passSegmented.selectedSegmentIndex = 0;
    }
    if ([appDelegate.teamPitStats.pass isEqual: @"maybe"]) {
        self.passSegmented.selectedSegmentIndex = 1;
    }
    if ([appDelegate.teamPitStats.pass isEqual: @"no"]) {
        self.passSegmented.selectedSegmentIndex = 2;
    }
    if ([appDelegate.teamPitStats.catches isEqual: @"yes"]) {
        self.catchSegmented.selectedSegmentIndex = 0;
    }
    if ([appDelegate.teamPitStats.catches isEqual: @"maybe"]) {
        self.catchSegmented.selectedSegmentIndex = 1;
    }
    if ([appDelegate.teamPitStats.catches isEqual: @"no"]) {
        self.catchSegmented.selectedSegmentIndex = 2;
    }
    if (appDelegate.teamPitStats.autoBalls > 0) {
        self.autoBallsStepper.value = [appDelegate.teamPitStats.autoBalls floatValue];
        self.autoBallLabel.text = [NSString stringWithFormat:@"%@%@", appDelegate.teamPitStats.autoBalls, @"%"];
    }
    if ([appDelegate.teamPitStats.autoMoves isEqual: @"yes"]) {
        self.autoMoveSegmented.selectedSegmentIndex = 0;
    }
    if ([appDelegate.teamPitStats.autoMoves isEqual: @"maybe"]) {
        self.autoMoveSegmented.selectedSegmentIndex = 1;
    }
    if ([appDelegate.teamPitStats.autoMoves isEqual: @"no"]) {
        self.autoMoveSegmented.selectedSegmentIndex = 2;
    }
    if (appDelegate.teamPitStats.autoScores > 0) {
        self.autoGoalsSlider.value = [appDelegate.teamPitStats.autoScores floatValue];
        self.autoGoalLabel.text = [NSString stringWithFormat:@"%@%@", appDelegate.teamPitStats.autoScores, @"%"];
    }
    if ([appDelegate.teamPitStats.defense isEqual: @"yes"]) {
        self.defenseSegmented.selectedSegmentIndex = 0;
    }
    if ([appDelegate.teamPitStats.defense isEqual: @"maybe"]) {
        self.defenseSegmented.selectedSegmentIndex = 1;
    }
    if ([appDelegate.teamPitStats.defense isEqual: @"no"]) {
        self.defenseSegmented.selectedSegmentIndex = 2;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)textChanged:(UITextField *)sender {
    appDelegate.teamPitStats.teamNumber = self.teamNumber.text;
    [self.teamNumber resignFirstResponder];
}

-(IBAction)topGoalSet:(id)sender {
    appDelegate.teamPitStats.highGoal = [NSNumber numberWithFloat:lroundf(self.topGoalSlider.value)];
    self.topGoalLabel.text = [NSString stringWithFormat:@"%@%@",appDelegate.teamPitStats.highGoal, @"%"];
    NSLog(@"%@", appDelegate.teamPitStats.highGoal);
}

-(IBAction)lowGoalSet:(id)sender {
    appDelegate.teamPitStats.lowGoal = [NSNumber numberWithFloat:lroundf(self.lowGoalSlider.value)];
    self.lowGoalLabel.text = [NSString stringWithFormat:@"%@%@",appDelegate.teamPitStats.lowGoal, @"%"];
    NSLog(@"%@", appDelegate.teamPitStats.lowGoal);
}
-(IBAction)trussSet:(id)sender {
    appDelegate.teamPitStats.truss = [NSNumber numberWithFloat:lroundf(self.trussSlider.value)];
    self.trussLabel.text = [NSString stringWithFormat:@"%@%@",appDelegate.teamPitStats.truss, @"%"];
    NSLog(@"%@", appDelegate.teamPitStats.truss);
}
-(IBAction)passSet:(id)sender {
    if (self.passSegmented.selectedSegmentIndex == 0) {
        appDelegate.teamPitStats.pass = @"yes";
    }
    else if (self.passSegmented.selectedSegmentIndex == 1) {
        appDelegate.teamPitStats.pass = @"maybe";
    }
    else if (self.passSegmented.selectedSegmentIndex == 2) {
        appDelegate.teamPitStats.pass = @"no";
    }
    NSLog(@"%@", appDelegate.teamPitStats.pass);
}
-(IBAction)catchSet:(id)sender {
    if (self.catchSegmented.selectedSegmentIndex == 0) {
        appDelegate.teamPitStats.catches = @"yes";
    }
    else if (self.catchSegmented.selectedSegmentIndex == 1) {
        appDelegate.teamPitStats.catches = @"maybe";
    }
    else if (self.catchSegmented.selectedSegmentIndex == 2) {
        appDelegate.teamPitStats.catches = @"no";
    }
    NSLog(@"%@", appDelegate.teamPitStats.catches);
}
-(IBAction)ballsAutoSet:(id)sender {
    appDelegate.teamPitStats.autoBalls = [NSNumber numberWithFloat:lroundf(self.autoBallsStepper.value)];
    self.autoBallLabel.text = [NSString stringWithFormat:@"%@", appDelegate.teamPitStats.autoBalls];
    NSLog(@"%@",appDelegate.teamPitStats.autoBalls);
}
-(IBAction)movesAutoSet:(id)sender {
    if (self.autoMoveSegmented.selectedSegmentIndex == 0) {
        appDelegate.teamPitStats.autoMoves = @"yes";
    }
    else if (self.passSegmented.selectedSegmentIndex == 1) {
        appDelegate.teamPitStats.autoMoves = @"maybe";
    }
    else if (self.passSegmented.selectedSegmentIndex == 2) {
        appDelegate.teamPitStats.autoMoves = @"no";
    }
    NSLog(@"%@", appDelegate.teamPitStats.autoMoves);
}
-(IBAction)goalsAutoSet:(id)sender {
    appDelegate.teamPitStats.autoScores = [NSNumber numberWithFloat:lroundf(self.autoGoalsSlider.value)];
    self.autoGoalLabel.text = [NSString stringWithFormat:@"%@%@", appDelegate.teamPitStats.autoScores,@"%"];
    NSLog(@"%@",appDelegate.teamPitStats.autoScores);
}
-(IBAction)defensiveSet:(id)sender {
    if (self.defenseSegmented.selectedSegmentIndex == 0) {
        appDelegate.teamPitStats.defense = @"yes";
    }
    else if (self.defenseSegmented.selectedSegmentIndex == 1) {
        appDelegate.teamPitStats.defense = @"maybe";
    }
    else if (self.defenseSegmented.selectedSegmentIndex == 2) {
        appDelegate.teamPitStats.defense = @"no";
    }
    NSLog(@"%@", appDelegate.teamPitStats.defense);
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[PSNotesViewController class]]) {
        
        if (appDelegate.savePhotos) {
            UIGraphicsBeginImageContext(self.view.bounds.size);
            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *screenshotImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            UIImageWriteToSavedPhotosAlbum(screenshotImage, nil, nil, nil);
            NSLog(@"DataSaved");
        }
        
        PSNotesViewController *destinationVC = (PSNotesViewController *)segue.destinationViewController;
        destinationVC.teamNumber = self.teamNumber.text;
    }
}
- (IBAction)removeKeyboard:(id)sender {
    [sender resignFirstResponder];
}
@end
