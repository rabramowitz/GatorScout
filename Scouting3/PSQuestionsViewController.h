//
//  PSQuestionsViewController.h
//  Scouting3
//
//  Created by Becky Abramowitz on 3/7/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "GTBXAppDelegate.h"

@interface PSQuestionsViewController : UIViewController




@property (weak,nonatomic) IBOutlet UITextField *teamNumber;
@property (weak,nonatomic) IBOutlet UISlider *topGoalSlider;
@property (weak,nonatomic) IBOutlet UISlider *lowGoalSlider;
@property (weak,nonatomic) IBOutlet UISlider *trussSlider;
@property (weak,nonatomic) IBOutlet UISegmentedControl *passSegmented;
@property (weak,nonatomic) IBOutlet UISegmentedControl *catchSegmented;
@property (weak,nonatomic) IBOutlet UISegmentedControl *autoMoveSegmented;
@property (weak,nonatomic) IBOutlet UIStepper *autoBallsStepper;
@property (weak,nonatomic) IBOutlet UISlider *autoGoalsSlider;
@property (weak,nonatomic) IBOutlet UISegmentedControl *defenseSegmented;


@property (weak,nonatomic) IBOutlet UILabel *topGoalLabel;
@property (weak,nonatomic) IBOutlet UILabel *lowGoalLabel;
@property (weak,nonatomic) IBOutlet UILabel *trussLabel;
@property (weak,nonatomic) IBOutlet UILabel *autoBallLabel;
@property (weak,nonatomic) IBOutlet UILabel *autoGoalLabel;

-(IBAction)textChanged:(UITextField *)sender;
-(IBAction)topGoalSet:(id)sender;
-(IBAction)lowGoalSet:(id)sender;
-(IBAction)trussSet:(id)sender;
-(IBAction)passSet:(id)sender;
-(IBAction)catchSet:(id)sender;
-(IBAction)ballsAutoSet:(id)sender;
-(IBAction)movesAutoSet:(id)sender;
-(IBAction)goalsAutoSet:(id)sender;
-(IBAction)defensiveSet:(id)sender;

@end
