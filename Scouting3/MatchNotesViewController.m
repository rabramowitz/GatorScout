//
//  MatchNotesViewController.m
//  GatorScout
//
//  Created by Becky Abramowitz on 3/27/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import "MatchNotesViewController.h"
#import "GTBXAppDelegate.h"

@interface MatchNotesViewController ()

@end

@implementation MatchNotesViewController {
    int lastValue;
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
        appDelegate = (GTBXAppDelegate*) [[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view.
    if ([appDelegate.alliance isEqual: @"red"]) {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"redbackground.png"]]];
    }
    else {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bluebackground.png"]]];
    }
    [self.teamSelector setTitle:[NSString stringWithFormat:@"Team %@",appDelegate.team1stats.teamNumber] forSegmentAtIndex:0];
    [self.teamSelector setTitle:[NSString stringWithFormat:@"Team %@",appDelegate.team2stats.teamNumber] forSegmentAtIndex:1];
    [self.teamSelector setTitle:[NSString stringWithFormat:@"Team %@",appDelegate.team3stats.teamNumber] forSegmentAtIndex:2];
    if (self.teamSelector.selectedSegmentIndex == 0) {
        self.notesField.text = appDelegate.team1stats.notes;
    }
    if (self.teamSelector.selectedSegmentIndex == 1) {
        self.notesField.text = appDelegate.team2stats.notes;
    }
    if (self.teamSelector.selectedSegmentIndex == 2) {
        self.notesField.text = appDelegate.team3stats.notes;
    }
    lastValue = 1;

}

-(IBAction)teamChanged:(UISegmentedControl *)teamSelector {
    if (lastValue == 1) {
        appDelegate.team1stats.notes = self.notesField.text;
        self.notesField.text = @"";
    }
    if (lastValue == 2) {
        appDelegate.team2stats.notes = self.notesField.text;
        self.notesField.text = @"";
    }
    if (lastValue == 3) {
        appDelegate.team3stats.notes = self.notesField.text;
        self.notesField.text = @"";
    }
    if (self.teamSelector.selectedSegmentIndex == 0) {
        self.notesField.text = appDelegate.team1stats.notes;
        lastValue = 1;
    }
    if (self.teamSelector.selectedSegmentIndex == 1) {
        self.notesField.text = appDelegate.team2stats.notes;
        lastValue = 2;
    }
    if (self.teamSelector.selectedSegmentIndex == 2) {
        self.notesField.text = appDelegate.team3stats.notes;
        lastValue = 3;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if (lastValue == 1) {
        appDelegate.team1stats.notes = self.notesField.text;
    }
    if (lastValue == 2) {
        appDelegate.team2stats.notes = self.notesField.text;
    }
    if (lastValue == 3) {
        appDelegate.team3stats.notes = self.notesField.text;
    }
    appDelegate.team1stats.notes = [appDelegate.team1stats.notes stringByReplacingOccurrencesOfString:@"\n" withString:@"; "];
    appDelegate.team2stats.notes = [appDelegate.team2stats.notes stringByReplacingOccurrencesOfString:@"\n" withString:@"; "];
    appDelegate.team3stats.notes = [appDelegate.team3stats.notes stringByReplacingOccurrencesOfString:@"\n" withString:@"; "];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
