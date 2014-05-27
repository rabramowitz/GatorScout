//
//  SummaryViewController.m
//  Scouting3
//
//  Created by Becky Abramowitz on 3/8/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import "SummaryViewController.h"
#import "GTBXAppDelegate.h"
#import "GTBXViewController.h"

@interface SummaryViewController ()

@end

@implementation SummaryViewController

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
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"greenbackground.png"]]];
    self.team1Label.text = appDelegate.team1stats.teamNumber;
    self.team2Label.text = appDelegate.team2stats.teamNumber;
    self.team3Label.text = appDelegate.team3stats.teamNumber;
    
    
    if ([appDelegate.alliance isEqual: @"red"]) {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"redbackground.png"]]];
    }
    else {
        [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bluebackground.png"]]];
    }

    self.matchLabel.text = [[NSString alloc] initWithFormat: @"%d", appDelegate.currentMatchNumber];
    self.team1Possession.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.teleopPosessions];
    self.team2Possession.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.teleopPosessions];
    self.team3Possession.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.teleopPosessions];
    
    //teleop made high goal
    self.team1HGMade.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.teleopMadeHG];
    self.team2HGMade.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.teleopMadeHG];
    self.team3HGMade.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.teleopMadeHG];
    
    //teleop attempted high goal
    self.team1HGAttempted.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.teleopMadeHG + appDelegate.team1stats.teleopMissedHG];
    self.team2HGAttempted.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.teleopMadeHG + appDelegate.team2stats.teleopMissedHG];
    self.team3HGAttempted.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.teleopMadeHG + appDelegate.team3stats.teleopMissedHG];
    
    //teleop made low goal
    self.team1LGMade.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.teleopMadeLG];
    self.team2LGMade.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.teleopMadeLG];
    self.team3LGMade.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.teleopMadeLG];
    
    //teleop attempted low goal
    self.team1LGAttempted.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.teleopMadeLG + appDelegate.team1stats.teleopMissedLG];
    self.team2LGAttempted.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.teleopMadeLG + appDelegate.team2stats.teleopMissedLG];
    self.team3LGAttempted.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.teleopMadeLG + appDelegate.team3stats.teleopMissedLG];
    
    //auto made high goal
    self.team1HGMadeA.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.autoMadeHG];
    self.team2HGMadeA.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.autoMadeHG];
    self.team3HGMadeA.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.autoMadeHG];
    
    //auto attempted high goal
    self.team1HGAttemptedA.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.autoMadeHG + appDelegate.team1stats.autoMissedHG];
    self.team2HGAttemptedA.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.autoMadeHG + appDelegate.team2stats.autoMissedHG];
    self.team3HGAttemptedA.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.autoMadeHG + appDelegate.team3stats.autoMissedHG];
    
    //auto made low goal
    self.team1LGMadeA.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.autoMadeLG];
    self.team2LGMadeA.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.autoMadeLG];
    self.team3LGMadeA.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.autoMadeLG];
    
    //auto attempted low goal
    self.team1LGAttemptedA.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.autoMadeLG + appDelegate.team1stats.autoMissedLG];
    self.team2LGAttemptedA.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.autoMadeLG + appDelegate.team2stats.autoMissedLG];
    self.team3LGAttemptedA.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.autoMadeLG + appDelegate.team3stats.autoMissedLG];
    
    //trusses
    self.team1Truss.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.teleopTrussMade];
    self.team2Truss.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.teleopTrussMade];
    self.team3Truss.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.teleopTrussMade];
    
    //trusses missed
    self.team1trussMiss.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.teleopTrussMissed + appDelegate.team1stats.teleopTrussMade];
    self.team2TrussMiss.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.teleopTrussMissed + appDelegate.team2stats.teleopTrussMade];
    self.team3TrussMiss.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.teleopTrussMissed + appDelegate.team3stats.teleopTrussMade];
    
    //catches
    self.team1Catch.text = [NSString stringWithFormat:@"%d", appDelegate.team1stats.teleopCaught];
    self.team2Catch.text = [NSString stringWithFormat:@"%d", appDelegate.team2stats.teleopCaught];
    self.team3Catch.text = [NSString stringWithFormat:@"%d", appDelegate.team3stats.teleopCaught];
    
    //broken/notbroken
    if (appDelegate.team1stats.broken == FALSE) {
        self.team1broke.text = [NSString stringWithFormat: @""];
    }
    else {
        self.team1broke.text = [NSString stringWithFormat: @"Broke"];
    }
    if (appDelegate.team2stats.broken == FALSE) {
        self.team2broke.text = [NSString stringWithFormat: @""];
    }
    else {
        self.team2broke.text = [NSString stringWithFormat: @"Broke"];
    }
    if (appDelegate.team3stats.broken == FALSE) {
        self.team3broke.text = [NSString stringWithFormat: @""];
    }
    else {
        self.team3broke.text = [NSString stringWithFormat: @"Broke"];
    }
    //moved/notmoved
    if (appDelegate.team1stats.autoMoved == FALSE) {
        self.team1movedA.text = [NSString stringWithFormat: @""];
    }
    else {
        self.team1movedA.text = [NSString stringWithFormat: @"Moved"];
    }
    if (appDelegate.team2stats.autoMoved == FALSE) {
        self.team2movedA.text = [NSString stringWithFormat: @""];
    }
    else {
        self.team2movedA.text = [NSString stringWithFormat: @"Moved"];
    }
    if (appDelegate.team3stats.autoMoved == FALSE) {
        self.team3movedA.text = [NSString stringWithFormat: @""];
    }
    else {
        self.team3movedA.text = [NSString stringWithFormat: @"Moved"];
    }

     
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[GTBXViewController class]]) {
        
        [self saveTeamData:appDelegate.team1stats];
        [self saveTeamData:appDelegate.team2stats];
        [self saveTeamData:appDelegate.team3stats];
        
        if (appDelegate.savePhotos) {
            UIGraphicsBeginImageContext(self.view.bounds.size);
            [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
            UIImage *screenshotImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            UIImageWriteToSavedPhotosAlbum(screenshotImage, nil, nil, nil);
            NSLog(@"Data Saved");
        }
        
        if ([MFMailComposeViewController canSendMail] && appDelegate.sendEmailData)
        {
            MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
            
            mailer.mailComposeDelegate = self;
            
            [mailer setSubject:[NSString stringWithFormat:@"Match %d %@ alliance", appDelegate.currentMatchNumber, appDelegate.alliance]];
            
            NSArray *toRecipients = [NSArray arrayWithObjects:appDelegate.scoutingEmail, nil];
            [mailer setToRecipients:toRecipients];
            NSString *statsExplanation = @"team number, match number, alliance, autoMoved, autoMadeHG, autoMissedHG, autoMadeLG, autoMissedLG, teleopMadeHG, teleopMissedHG, teleopMadeLG, teleopMissedLG, teleopCaught, teleopPassed, teleopPosessions, teleopTrussMade, teleopTrussMissed, teleopDefensive, teleopDropped, broken?, penalties, notes, scoutName, tournamentName";
            NSString *team1statsInTabForm = [self formatForExport:appDelegate.team1stats];
            NSString *team2statsInTabForm = [self formatForExport:appDelegate.team2stats];
            NSString *team3statsInTabForm = [self formatForExport:appDelegate.team3stats];
            NSString *emailBody = [NSString stringWithFormat:@"Notes: \n\n %@ \n %@ \n %@ \n Decoding: %@", team1statsInTabForm, team2statsInTabForm, team3statsInTabForm, statsExplanation];
            [mailer setMessageBody:emailBody isHTML:NO];
            
            [self presentViewController:mailer animated:YES completion:nil];
        }
        
        NSLog(@"Data Sent");
        
        [appDelegate.team1stats clearInfo];
        [appDelegate.team2stats clearInfo];
        [appDelegate.team3stats clearInfo];
        NSLog(@"Data Cleared");
        
        GTBXViewController *homeScreen = [self.storyboard instantiateViewControllerWithIdentifier:@"homeScreen"];

        [self.navigationController pushViewController:homeScreen animated:YES];
        [[homeScreen navigationController]setNavigationBarHidden:YES animated:YES];
    }
}

-(NSString *)formatForExport:(TeamMatch*)thisTeam {
    NSString *teamStatsInTabForm = [NSString stringWithFormat:@"\t%@\t%@\t%@\t%@\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%@\t%d\t%@\t%@\t%@", thisTeam.teamNumber, thisTeam.matchNumber, thisTeam.alliance, [NSNumber numberWithBool:thisTeam.autoMoved], thisTeam.autoMadeHG, thisTeam.autoMissedHG, thisTeam.autoMadeLG, thisTeam.autoMissedLG, thisTeam.teleopMadeHG, thisTeam.teleopMissedHG, thisTeam.teleopMadeLG, thisTeam.teleopMissedLG, thisTeam.teleopCaught, thisTeam.teleopPassed, thisTeam.teleopPosessions, thisTeam.teleopTrussMade, thisTeam.teleopTrussMissed, thisTeam.teleopDefensive, thisTeam.teleopDropped, [NSNumber numberWithBool:thisTeam.broken], thisTeam.penalties, thisTeam.notes, thisTeam.scoutName, thisTeam.tournamentName];
    return teamStatsInTabForm;
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message has been sent to the outbox.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    // Remove the mail view
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

-(void)saveTeamData:(TeamMatch *)team
{
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newTeamMatch;
    newTeamMatch = [NSEntityDescription
                    insertNewObjectForEntityForName:@"DTeammatches"
                    inManagedObjectContext:context];
    [newTeamMatch setValue:team.alliance forKey:@"alliance"];
    [newTeamMatch setValue:team.teamNumber forKey:@"teamNumber"];
    [newTeamMatch setValue:team.matchNumber forKey:@"matchNumber"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.autoMadeHG] forKey:@"autoMadeHG"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.autoMadeLG] forKey:@"autoMadeLG"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.autoMissedHG] forKey:@"autoMissedHG"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.autoMissedLG] forKey:@"autoMissedLG"];
    [newTeamMatch setValue:[NSNumber numberWithBool:team.autoMoved] forKey:@"autoMoved"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.teleopCaught] forKey:@"teleopCaught"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.teleopMadeHG] forKey:@"teleopMadeHG"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.teleopMadeLG] forKey:@"teleopMadeLG"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.teleopMissedHG] forKey:@"teleopMissedHG"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.teleopMissedLG] forKey:@"teleopMissedLG"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.teleopPassed] forKey:@"teleopPassed"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.teleopPosessions] forKey:@"teleopPosessions"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.teleopTrussMade] forKey:@"teleopTrussMade"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.teleopTrussMissed] forKey:@"teleopTrussMissed"];
    [newTeamMatch setValue:[NSNumber numberWithBool:team.teleopDefensive] forKey:@"teleopDefensive"];
    [newTeamMatch setValue:[NSNumber numberWithBool:team.teleopDropped] forKey:@"teleopDropped"];
    [newTeamMatch setValue:[NSNumber numberWithBool:team.broken] forKey:@"broken"];
    [newTeamMatch setValue:[NSNumber numberWithInt:team.penalties] forKey:@"penalties"];
    [newTeamMatch setValue:team.notes forKey:@"notes"];
    [newTeamMatch setValue:[NSDate new] forKey:@"timestamp"];
    [newTeamMatch setValue:appDelegate.tournamentName forKey:@"tournamentName"];
    [newTeamMatch setValue:appDelegate.scoutName forKey:@"scoutName"];
    NSError *error;
    [context save:&error];
    NSLog(@"Team Match saved with error %@", error);
}


@end
