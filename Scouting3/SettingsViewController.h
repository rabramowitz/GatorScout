//
//  SettingsViewController.h
//  Scouting3
//
//  Created by Becky Abramowitz on 3/4/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GTBXAppDelegate.h"

@interface SettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *tournamentField;
@property (weak, nonatomic) IBOutlet UITextField *scoutingEmailField;
@property (weak, nonatomic) IBOutlet UISwitch *sendMatchEmailsSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *savePhotosSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *keepMeSafe;

@end
