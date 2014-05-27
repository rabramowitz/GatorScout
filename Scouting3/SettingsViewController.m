//
//  SettingsViewController.m
//  Scouting3
//
//  Created by Becky Abramowitz on 3/4/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

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
    self.nameField.text = appDelegate.scoutName;
    self.tournamentField.text = appDelegate.tournamentName;
    self.scoutingEmailField.text = appDelegate.scoutingEmail;
    [self.sendMatchEmailsSwitch setOn:appDelegate.sendEmailData];
    [self.savePhotosSwitch setOn:appDelegate.savePhotos];
    [self.keepMeSafe setOn:appDelegate.keepMeSafe];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    appDelegate.sendEmailData = [self.sendMatchEmailsSwitch isOn];
    appDelegate.savePhotos = [self.savePhotosSwitch isOn];
    appDelegate.keepMeSafe = [self.keepMeSafe isOn];
}

- (IBAction)didEndOnExit:(UITextField *)sender {
    appDelegate.scoutName = self.nameField.text;
    appDelegate.tournamentName = self.tournamentField.text;
    appDelegate.scoutingEmail = self.scoutingEmailField.text;
    [self.nameField resignFirstResponder];
    [self.tournamentField resignFirstResponder];
    [self.scoutingEmailField resignFirstResponder];
}

@end
