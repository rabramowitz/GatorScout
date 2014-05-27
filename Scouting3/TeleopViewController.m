//
//  TeleopViewController.m
//  GatorScout
//
//  Created by Carly Robison on 2/27/14.
//  Copyright (c) 2014 Carly Robison. All rights reserved.
//

#import "TeleopViewController.h"
#import "GTBXAppDelegate.h"

@interface TeleopViewController ()

@end

@implementation TeleopViewController

GTBXAppDelegate *appDelegate;
NSNumber *matchNum;
NSString *alliance;
NSString *scoutName;
NSString *tournamentName;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _currentTeam = @"";
	// Do any additional setup after loading the view.
    appDelegate = (GTBXAppDelegate*) [[UIApplication sharedApplication] delegate];
    matchNum = [NSNumber numberWithInt:appDelegate.currentMatchNumber];
    alliance = appDelegate.alliance;
    tournamentName = appDelegate.tournamentName;
    if (!appDelegate.scoutName) {
        scoutName = @"gatorbotics";
    } else {
        scoutName = appDelegate.scoutName;
    }
    if ([alliance isEqual: @"red"]) {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"redbackground.png"]]];
    }
    else {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bluebackground.png"]]];
    }
    //button stuff
    [self clearTeams];
    self.currentTeam = @"";
    [self.firstTeamButton setTitle:appDelegate.team1stats.teamNumber forState:UIControlStateNormal];
    [self.secondTeamButton setTitle:appDelegate.team2stats.teamNumber forState:UIControlStateNormal];
    [self.thirdTeamButton setTitle:appDelegate.team3stats.teamNumber forState:UIControlStateNormal];
    [self.firstTeamNoShow setTitle:appDelegate.team1stats.teamNumber  forState:UIControlStateNormal];
    [self.secondTeamNoShow setTitle:appDelegate.team2stats.teamNumber forState:UIControlStateNormal];
    [self.thirdTeamNoShow setTitle:appDelegate.team3stats.teamNumber forState:UIControlStateNormal];
    [self.firstTeamPenalty setTitle:appDelegate.team1stats.teamNumber  forState:UIControlStateNormal];
    [self.secondTeamPenalty setTitle:appDelegate.team2stats.teamNumber forState:UIControlStateNormal];
    [self.thirdTeamPenalty setTitle:appDelegate.team3stats.teamNumber forState:UIControlStateNormal];
    [self.firstTeamDefense setTitle:appDelegate.team1stats.teamNumber  forState:UIControlStateNormal];
    [self.secondTeamDefense setTitle:appDelegate.team2stats.teamNumber forState:UIControlStateNormal];
    [self.thirdTeamDefense setTitle:appDelegate.team3stats.teamNumber forState:UIControlStateNormal];
    self.matchLabel.text = [[NSString alloc] initWithFormat: @"%d", appDelegate.currentMatchNumber];
}

-(void)clearTeams
{
    [self.thirdTeamButton setSelected:false];
    [self.secondTeamButton setSelected:false];
    [self.firstTeamButton setSelected:false];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)teamSelected:(id)sender {
    NSString *action = @"gained posession";
    //button stuff
    [self clearTeams];
    [sender setSelected:true];
    if (self.currentTeam != [sender currentTitle]) { // aka new team
    
        self.currentTeam = [sender currentTitle];
        NSManagedObjectContext *context =
        [appDelegate managedObjectContext];
        NSManagedObject *newEvent;
        newEvent = [NSEntityDescription
                insertNewObjectForEntityForName:@"DEvents"
                inManagedObjectContext:context];
        [newEvent setValue: action forKey:@"action"];
        [newEvent setValue: alliance forKey:@"alliance"];
        [newEvent setValue: matchNum forKey:@"matchNumber"];
        [newEvent setValue: scoutName forKey:@"scoutName"];
        [newEvent setValue: self.currentTeam forKey:@"teamNumber"];
        [newEvent setValue: [NSDate date] forKey:@"timestamp"];
        [newEvent setValue: tournamentName forKey:@"tournamentName"];
        NSError *error;
        [context save:&error];
        NSLog(@"Event saved with error %@", error);
    
        if (self.currentTeam == appDelegate.team1stats.teamNumber) {
            appDelegate.team1stats.teleopPosessions += 1;
        }
        if (self.currentTeam == appDelegate.team2stats.teamNumber) {
            appDelegate.team2stats.teleopPosessions += 1;
        }
        if (self.currentTeam == appDelegate.team3stats.teamNumber) {
            appDelegate.team3stats.teleopPosessions += 1;
        }
    
        self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ %@", self.currentTeam, action];
    }
}
- (IBAction)passed:(id)sender {
    NSString *action = @"passed";
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newEvent;
    newEvent = [NSEntityDescription
                insertNewObjectForEntityForName:@"DEvents"
                inManagedObjectContext:context];
    [newEvent setValue: action forKey:@"action"];
    [newEvent setValue: alliance forKey:@"alliance"];
    [newEvent setValue: matchNum forKey:@"matchNumber"];
    [newEvent setValue: scoutName forKey:@"scoutName"];
    [newEvent setValue: self.currentTeam forKey:@"teamNumber"];
    [newEvent setValue: [NSDate date] forKey:@"timestamp"];
    [newEvent setValue: tournamentName forKey:@"tournamentName"];
    NSError *error;
    [context save:&error];
    NSLog(@"Event saved with error %@", error);
    
    if (self.currentTeam == appDelegate.team1stats.teamNumber) {
        appDelegate.team1stats.teleopPassed += 1;
    }
    if (self.currentTeam == appDelegate.team2stats.teamNumber) {
        appDelegate.team2stats.teleopPassed += 1;
    }
    if (self.currentTeam == appDelegate.team3stats.teamNumber) {
        appDelegate.team3stats.teleopPassed += 1;
    }
    
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ %@", self.currentTeam, action];
    
    [self clearTeams];
    self.currentTeam = @"";
}

- (IBAction)trussMade:(id)sender {
    NSString *action = @"trussMade";
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newEvent;
    newEvent = [NSEntityDescription
                insertNewObjectForEntityForName:@"DEvents"
                inManagedObjectContext:context];
    [newEvent setValue: action forKey:@"action"];
    [newEvent setValue: alliance forKey:@"alliance"];
    [newEvent setValue: matchNum forKey:@"matchNumber"];
    [newEvent setValue: scoutName forKey:@"scoutName"];
    [newEvent setValue: self.currentTeam forKey:@"teamNumber"];
    [newEvent setValue: [NSDate date] forKey:@"timestamp"];
    [newEvent setValue: tournamentName forKey:@"tournamentName"];
    NSError *error;
    [context save:&error];
    NSLog(@"Event saved with error %@", error);
    
    if (self.currentTeam == appDelegate.team1stats.teamNumber) {
        appDelegate.team1stats.teleopTrussMade += 1;
    }
    if (self.currentTeam == appDelegate.team2stats.teamNumber) {
        appDelegate.team2stats.teleopTrussMade += 1;
    }
    if (self.currentTeam == appDelegate.team3stats.teamNumber) {
        appDelegate.team3stats.teleopTrussMade += 1;
    }
    
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ %@", self.currentTeam, action];
    
    [self clearTeams];
    self.currentTeam = @"";
}

-(IBAction)trussMissed:(id)sender {
    NSString *action = @"trussMissed";
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newEvent;
    newEvent = [NSEntityDescription
                insertNewObjectForEntityForName:@"DEvents"
                inManagedObjectContext:context];
    [newEvent setValue: action forKey:@"action"];
    [newEvent setValue: alliance forKey:@"alliance"];
    [newEvent setValue: matchNum forKey:@"matchNumber"];
    [newEvent setValue: scoutName forKey:@"scoutName"];
    [newEvent setValue: self.currentTeam forKey:@"teamNumber"];
    [newEvent setValue: [NSDate date] forKey:@"timestamp"];
    [newEvent setValue: tournamentName forKey:@"tournamentName"];
    NSError *error;
    [context save:&error];
    NSLog(@"Event saved with error %@", error);
    
    if (self.currentTeam == appDelegate.team1stats.teamNumber) {
        appDelegate.team1stats.teleopTrussMissed += 1;
    }
    if (self.currentTeam == appDelegate.team2stats.teamNumber) {
        appDelegate.team2stats.teleopTrussMissed += 1;
    }
    if (self.currentTeam == appDelegate.team3stats.teamNumber) {
        appDelegate.team3stats.teleopTrussMissed += 1;
    }
    
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ %@", self.currentTeam, action];
    
    [self clearTeams];
    self.currentTeam = @"";
}

- (IBAction)caught:(id)sender {
    NSString *action = @"caught";
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newEvent;
    newEvent = [NSEntityDescription
                insertNewObjectForEntityForName:@"DEvents"
                inManagedObjectContext:context];
    [newEvent setValue: action forKey:@"action"];
    [newEvent setValue: alliance forKey:@"alliance"];
    [newEvent setValue: matchNum forKey:@"matchNumber"];
    [newEvent setValue: scoutName forKey:@"scoutName"];
    [newEvent setValue: self.currentTeam forKey:@"teamNumber"];
    [newEvent setValue: [NSDate date] forKey:@"timestamp"];
    [newEvent setValue: tournamentName forKey:@"tournamentName"];
    NSError *error;
    [context save:&error];
    NSLog(@"Event saved with error %@", error);
    
    if (self.currentTeam == appDelegate.team1stats.teamNumber) {
        appDelegate.team1stats.teleopCaught += 1;
    }
    if (self.currentTeam == appDelegate.team2stats.teamNumber) {
        appDelegate.team2stats.teleopCaught += 1;
    }
    if (self.currentTeam == appDelegate.team3stats.teamNumber) {
        appDelegate.team3stats.teleopCaught += 1;
    }
    
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ %@", self.currentTeam, action];
}

- (IBAction)highGoalMade:(id)sender {
    NSString *action = @"high goal made";
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newEvent;
    newEvent = [NSEntityDescription
                insertNewObjectForEntityForName:@"DEvents"
                inManagedObjectContext:context];
    [newEvent setValue: action forKey:@"action"];
    [newEvent setValue: alliance forKey:@"alliance"];
    [newEvent setValue: matchNum forKey:@"matchNumber"];
    [newEvent setValue: scoutName forKey:@"scoutName"];
    [newEvent setValue: self.currentTeam forKey:@"teamNumber"];
    [newEvent setValue: [NSDate date] forKey:@"timestamp"];
    [newEvent setValue: tournamentName forKey:@"tournamentName"];
    NSError *error;
    [context save:&error];
    NSLog(@"Event saved with error %@", error);
    
    if (self.currentTeam == appDelegate.team1stats.teamNumber) {
        appDelegate.team1stats.teleopMadeHG += 1;
    }
    if (self.currentTeam == appDelegate.team2stats.teamNumber) {
        appDelegate.team2stats.teleopMadeHG += 1;
    }
    if (self.currentTeam == appDelegate.team3stats.teamNumber) {
        appDelegate.team3stats.teleopMadeHG += 1;
    }
    
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ %@", self.currentTeam, action];
    
    [self clearTeams];
    self.currentTeam = @"";
}

- (IBAction)highGoalMissed:(id)sender {
    NSString *action = @"high goal missed";
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newEvent;
    newEvent = [NSEntityDescription
                insertNewObjectForEntityForName:@"DEvents"
                inManagedObjectContext:context];
    [newEvent setValue: action forKey:@"action"];
    [newEvent setValue: alliance forKey:@"alliance"];
    [newEvent setValue: matchNum forKey:@"matchNumber"];
    [newEvent setValue: scoutName forKey:@"scoutName"];
    [newEvent setValue: self.currentTeam forKey:@"teamNumber"];
    [newEvent setValue: [NSDate date] forKey:@"timestamp"];
    [newEvent setValue: tournamentName forKey:@"tournamentName"];
    NSError *error;
    [context save:&error];
    NSLog(@"Event saved with error %@", error);
    
    if (self.currentTeam == appDelegate.team1stats.teamNumber) {
        appDelegate.team1stats.teleopMissedHG += 1;
    }
    if (self.currentTeam == appDelegate.team2stats.teamNumber) {
        appDelegate.team2stats.teleopMissedHG += 1;
    }
    if (self.currentTeam == appDelegate.team3stats.teamNumber) {
        appDelegate.team3stats.teleopMissedHG += 1;
    }
    
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ %@", self.currentTeam, action];
    
    [self clearTeams];
    self.currentTeam = @"";
}

- (IBAction)lowGoalMade:(id)sender {
    NSString *action = @"low goal made";
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newEvent;
    newEvent = [NSEntityDescription
                insertNewObjectForEntityForName:@"DEvents"
                inManagedObjectContext:context];
    [newEvent setValue: action forKey:@"action"];
    [newEvent setValue: alliance forKey:@"alliance"];
    [newEvent setValue: matchNum forKey:@"matchNumber"];
    [newEvent setValue: scoutName forKey:@"scoutName"];
    [newEvent setValue: self.currentTeam forKey:@"teamNumber"];
    [newEvent setValue: [NSDate date] forKey:@"timestamp"];
    [newEvent setValue: tournamentName forKey:@"tournamentName"];
    NSError *error;
    [context save:&error];
    NSLog(@"Event saved with error %@", error);
    
    if (self.currentTeam == appDelegate.team1stats.teamNumber) {
        appDelegate.team1stats.teleopMadeLG += 1;
    }
    if (self.currentTeam == appDelegate.team2stats.teamNumber) {
        appDelegate.team2stats.teleopMadeLG += 1;
    }
    if (self.currentTeam == appDelegate.team3stats.teamNumber) {
        appDelegate.team3stats.teleopMadeLG += 1;
    }
    
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ %@", self.currentTeam, action];
    
    [self clearTeams];
    self.currentTeam = @"";
}

- (IBAction)lowGoalMissed:(id)sender {
    NSString *action = @"low goal missed";
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newEvent;
    newEvent = [NSEntityDescription
                insertNewObjectForEntityForName:@"DEvents"
                inManagedObjectContext:context];
    [newEvent setValue: action forKey:@"action"];
    [newEvent setValue: alliance forKey:@"alliance"];
    [newEvent setValue: matchNum forKey:@"matchNumber"];
    [newEvent setValue: scoutName forKey:@"scoutName"];
    [newEvent setValue: self.currentTeam forKey:@"teamNumber"];
    [newEvent setValue: [NSDate date] forKey:@"timestamp"];
    [newEvent setValue: tournamentName forKey:@"tournamentName"];
    NSError *error;
    [context save:&error];
    NSLog(@"Event saved with error %@", error);
    
    if (self.currentTeam == appDelegate.team1stats.teamNumber) {
        appDelegate.team1stats.teleopMissedLG += 1;
    }
    if (self.currentTeam == appDelegate.team2stats.teamNumber) {
        appDelegate.team2stats.teleopMissedLG += 1;
    }
    if (self.currentTeam == appDelegate.team3stats.teamNumber) {
        appDelegate.team3stats.teleopMissedLG += 1;
    }
    
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ %@", self.currentTeam, action];
    
    [self clearTeams];
    self.currentTeam = @"";
}

-(IBAction)dropped:(id)sender {
    NSString *action = @"dropped";
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newEvent;
    newEvent = [NSEntityDescription
                insertNewObjectForEntityForName:@"DEvents"
                inManagedObjectContext:context];
    [newEvent setValue: action forKey:@"action"];
    [newEvent setValue: alliance forKey:@"alliance"];
    [newEvent setValue: matchNum forKey:@"matchNumber"];
    [newEvent setValue: scoutName forKey:@"scoutName"];
    [newEvent setValue: self.currentTeam forKey:@"teamNumber"];
    [newEvent setValue: [NSDate date] forKey:@"timestamp"];
    [newEvent setValue: tournamentName forKey:@"tournamentName"];
    NSError *error;
    [context save:&error];
    NSLog(@"Event saved with error %@", error);
    
    if (self.currentTeam == appDelegate.team1stats.teamNumber) {
        appDelegate.team1stats.teleopDropped += 1;
    }
    if (self.currentTeam == appDelegate.team2stats.teamNumber) {
        appDelegate.team2stats.teleopDropped += 1;
    }
    if (self.currentTeam == appDelegate.team3stats.teamNumber) {
        appDelegate.team3stats.teleopDropped += 1;
    }
    
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ %@", self.currentTeam, action];
    
    [self clearTeams];
    self.currentTeam = @"";
}

- (IBAction)team1defense:(id)sender {
    appDelegate.team1stats.teleopDefensive += 1;
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ defense", appDelegate.team1stats.teamNumber];
}

- (IBAction)team2defense:(id)sender {
    appDelegate.team2stats.teleopDefensive += 1;
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ defense", appDelegate.team2stats.teamNumber];
}

- (IBAction)team3defense:(id)sender {
    appDelegate.team3stats.teleopDefensive += 1;
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ defense", appDelegate.team3stats.teamNumber];
}

- (IBAction)team1penalty:(id)sender {
    appDelegate.team1stats.penalties += 1;
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ penalty", appDelegate.team1stats.teamNumber];
}

- (IBAction)team2penalty:(id)sender {
    appDelegate.team2stats.penalties += 1;
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ penalty", appDelegate.team2stats.teamNumber];
}

- (IBAction)team3penalty:(id)sender {
    appDelegate.team3stats.penalties += 1;
    self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ penalty", appDelegate.team3stats.teamNumber];
}

- (IBAction)team1broken:(id)sender {
    if ([sender isSelected]) {
        appDelegate.team1stats.broken = FALSE;
        [sender setSelected:FALSE];
        self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ broken revoked", appDelegate.team1stats.teamNumber];
    } else {
        appDelegate.team1stats.broken = TRUE;
        [sender setSelected:TRUE];
        self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ broken/NS", appDelegate.team1stats.teamNumber];
    }
}

- (IBAction)team2broken:(id)sender {
    if ([sender isSelected]) {
        appDelegate.team2stats.broken = FALSE;
        [sender setSelected:FALSE];
        self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ broken revoked", appDelegate.team2stats.teamNumber];
    } else {
        appDelegate.team2stats.broken = TRUE;
        [sender setSelected:TRUE];
        self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ broken/NS", appDelegate.team2stats.teamNumber];
    }
}

- (IBAction)team3broken:(id)sender {
    if ([sender isSelected]) {
        appDelegate.team3stats.broken = FALSE;
        [sender setSelected:FALSE];
        self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ broken revoked", appDelegate.team3stats.teamNumber];
    } else {
        appDelegate.team3stats.broken = TRUE;
        [sender setSelected:TRUE];
        self.reportActionLabel.text = [NSString stringWithFormat:@"Team %@ broken/NS", appDelegate.team3stats.teamNumber];
    }
}
@end
