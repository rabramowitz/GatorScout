//
//  PSNotesViewController.m
//  Scouting3
//
//  Created by Carly Robison on 3/12/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import "PSNotesViewController.h"
#import "PSTeam.h"
#import "GTBXAppDelegate.h"
#import "GTBXViewController.h"

@interface PSNotesViewController ()
@property (weak, nonatomic) IBOutlet UILabel *teamNumberLabel;

@end

@implementation PSNotesViewController

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
    if (!self.teamNumber) {
        self.teamNumber = @"?";
    }
    self.teamNumberLabel.text = self.teamNumber;
	// Do any additional setup after loading the view.
    
    self.notes.text = appDelegate.teamPitStats.notes;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textViewDidChange:(UITextView *)textView {
    appDelegate.teamPitStats.notes = self.notes.text;
    NSLog(@"%@",appDelegate.teamPitStats.notes);
}

- (void)viewWillDisappear:(BOOL)animated {
    UIGraphicsBeginImageContext(self.view.bounds.size);
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *screenshotImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(screenshotImage, nil, nil, nil);
    NSLog(@"DataSaved");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    appDelegate.teamPitStats.notes = self.notes.text;
    if ([segue.destinationViewController isKindOfClass:[GTBXViewController class]]) {
        
        savePitData:appDelegate.teamPitStats;
        
        if ([MFMailComposeViewController canSendMail])
        {
            MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
            
            mailer.mailComposeDelegate = self;
            
            [mailer setSubject:[NSString stringWithFormat:@"Pit Scout Team %@", appDelegate.teamPitStats.teamNumber]];
            
            NSArray *toRecipients = [NSArray arrayWithObjects:appDelegate.scoutingEmail, nil];
            [mailer setToRecipients:toRecipients];
            NSString *statsExplanation = @"team number, top goal percent, low goal percent, truss percent, pass, catch, auto moves, auto balls used, auto goals, defense, notes, scoutName, tournamentName";
            NSString *team1statsInTabForm = [NSString stringWithFormat:@"\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@\t%@", appDelegate.teamPitStats.teamNumber, appDelegate.teamPitStats.highGoal, appDelegate.teamPitStats.lowGoal, appDelegate.teamPitStats.truss, appDelegate.teamPitStats.pass, appDelegate.teamPitStats.catches, appDelegate.teamPitStats.autoMoves, appDelegate.teamPitStats.autoBalls, appDelegate.teamPitStats.autoScores, appDelegate.teamPitStats.defense, appDelegate.teamPitStats.notes, appDelegate.scoutName, appDelegate.tournamentName];
            NSString *emailBody = [NSString stringWithFormat:@"Notes: \n\n %@ \n\n Decoding: %@", team1statsInTabForm,statsExplanation];
            [mailer setMessageBody:emailBody isHTML:NO];
            
            [self presentViewController:mailer animated:YES completion:nil];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                            message:@"Your device doesn't support the composer sheet"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
        
        NSLog(@"Data Sent");
        NSLog(@"Data Cleared");
        
        GTBXViewController *homeScreen = [self.storyboard instantiateViewControllerWithIdentifier:@"homeScreen"];
        
        [self.navigationController pushViewController:homeScreen animated:YES];
        [[homeScreen navigationController]setNavigationBarHidden:YES animated:YES];
        appDelegate = (GTBXAppDelegate *) [[UIApplication sharedApplication] delegate];
        [appDelegate.teamPitStats clearInfo];
    }
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


-(void)saveTeamPitData:(PSTeam *)team
{
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    NSManagedObject *newPitScout;
    newPitScout = [NSEntityDescription
                    insertNewObjectForEntityForName:@"DPits"
                    inManagedObjectContext:context];
    [newPitScout setValue:team.teamNumber forKey:@"teamNumber"];
    [newPitScout setValue:team.autoBalls forKey:@"autoBalls"];
    [newPitScout setValue:team.autoMoves forKey:@"autoMoves"];
    [newPitScout setValue:team.autoScores forKey:@"autoScores"];
    [newPitScout setValue:team.catches forKey:@"catches"];
    [newPitScout setValue:team.defense forKey:@"defense"];
    [newPitScout setValue:team.highGoal forKey:@"highGoal"];
    [newPitScout setValue:team.lowGoal forKey:@"lowGoal"];
    [newPitScout setValue:team.notes forKey:@"notes"];
    [newPitScout setValue:team.pass forKey:@"pass"];
    [newPitScout setValue:team.truss forKey:@"truss"];
    NSError *error;
    [context save:&error];
    NSLog(@"Team Pit Scout saved with error %@", error);
}



@end
