//
//  SearchResultsTableViewController.m
//  GatorScout
//
//  Created by Carly Robison on 4/22/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import "SearchResultsTableViewController.h"
#import "TeamMatch.h"
#import "GTBXAppDelegate.h"
#import "GTBXViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface SearchResultsTableViewController ()

@end

@implementation SearchResultsTableViewController

GTBXAppDelegate *appDelegate;
NSMutableArray *formattedStringArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!self.searchResults){
        self.searchResults = [[NSMutableArray alloc] init];
    }
    appDelegate = (GTBXAppDelegate*) [[UIApplication sharedApplication] delegate];
    [self loadInitialData];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.searchResults count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell"
                                                            forIndexPath:indexPath];
    
    
    TeamMatch *team = [self.searchResults objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"Team %@ \nMatch #%@ \n%@", team.teamNumber, team.matchNumber, team.alliance];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Auto: HG %@ LG %@ %@ \nTeleop: HG %@ LG %@ Truss %@ %@ %@ \nOverall: Poss: %d %@ %@ %@ \nNotes: %@",
                                 [self formatRatio:team.autoMadeHG withD:team.autoMissedHG],
                                 [self formatRatio:team.autoMadeLG withD:team.autoMissedLG],
                                 [self formatIfTrue:team.autoMoved word:@"Moved"],
                                 //teleop
                                 [self formatRatio:team.teleopMadeHG withD:team.teleopMissedHG],
                                 [self formatRatio:team.teleopMadeLG withD:team.teleopMissedLG],
                                 [self formatRatio:team.teleopTrussMade withD:team.teleopTrussMissed],
                                 [self formatIntBool:team.teleopCaught withWord:@"Caught"],
                                 [self formatIntBool:team.teleopPassed withWord:@"Passed"],
                                 team.teleopPosessions,
                                 [self formatIntBool:team.teleopDropped withWord:@"Dropped"],
                                 [self formatIntBool:team.teleopDefensive withWord:@"Defensive"],
                                 [self formatIfTrue:team.broken word:@"Broken"],
                                 team.notes
                                 ];
    
    return cell;
}

-(NSString *)formatRatio:(int)numberOne withD:(int)numberTwo{
    return [NSString stringWithFormat:@"%d/%d", numberOne, numberOne + numberTwo];
}

-(NSString *)formatIntBool:(int)number withWord:(NSString *)word{
    if (number != 0) {
        return [NSString stringWithFormat:@"%@:%d", word, number];
    }
    return @"";
}

-(NSString *)formatIfTrue:(BOOL)trueness word:(NSString *)word{
    if (trueness) {
        return word;
    }
    return @"";
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)loadInitialData {
    self.searchResults = appDelegate.searchResults;
    [formattedStringArray removeAllObjects];
    formattedStringArray = [self formatIntoStrings:self.searchResults];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[GTBXViewController class]])
    {
        if ([MFMailComposeViewController canSendMail]){
            MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
            mailer.mailComposeDelegate = self;
            [mailer setSubject:@"Match Data Dump"];
            NSArray *toRecipients = [NSArray arrayWithObjects:appDelegate.scoutingEmail, nil];
            [mailer setToRecipients:toRecipients];
            NSString *statsExplanation = @"team number, match number, alliance, autoMoved, autoMadeHG, autoMissedHG, autoMadeLG, autoMissedLG, teleopMadeHG, teleopMissedHG, teleopMadeLG, teleopMissedLG, teleopCaught, teleopPassed, teleopPosessions, teleopTrussMade, teleopTrussMissed, teleopDefensive, teleopDropped, broken?, penalties, notes, scoutName, tournamentName";
            NSString *teamResults = @"";
            for (int i = 0; i < [formattedStringArray count]; i++) {
                teamResults = [NSString stringWithFormat:@"%@\n%@", teamResults, [formattedStringArray objectAtIndex:i]];
            }
            NSString *emailBody = [NSString stringWithFormat:@"%@ \n\n Decoding: %@", teamResults, statsExplanation];
            [mailer setMessageBody:emailBody isHTML:NO];
            
            [self presentViewController:mailer animated:YES completion:nil];
            NSLog(@"Data Sent");
        }
        GTBXViewController *homeScreen = [self.storyboard instantiateViewControllerWithIdentifier:@"homeScreen"];
        [self.navigationController pushViewController:homeScreen animated:YES];
        [[homeScreen navigationController]setNavigationBarHidden:YES animated:YES];
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

-(NSString *)formatForExport:(TeamMatch*)thisTeam {
    NSString *teamStatsInTabForm = [NSString stringWithFormat:@"\t%@\t%@\t%@\t%@\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%@\t%d\t%@\t%@\t%@", thisTeam.teamNumber, thisTeam.matchNumber, thisTeam.alliance, [NSNumber numberWithBool:thisTeam.autoMoved], thisTeam.autoMadeHG, thisTeam.autoMissedHG, thisTeam.autoMadeLG, thisTeam.autoMissedLG, thisTeam.teleopMadeHG, thisTeam.teleopMissedHG, thisTeam.teleopMadeLG, thisTeam.teleopMissedLG, thisTeam.teleopCaught, thisTeam.teleopPassed, thisTeam.teleopPosessions, thisTeam.teleopTrussMade, thisTeam.teleopTrussMissed, thisTeam.teleopDefensive, thisTeam.teleopDropped, [NSNumber numberWithBool:thisTeam.broken], thisTeam.penalties, thisTeam.notes, thisTeam.scoutName, thisTeam.tournamentName];
    return teamStatsInTabForm;
}

-(NSMutableArray *)formatIntoStrings:(NSMutableArray *)matches {
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (int i = 0; i < [matches count]; i++) {
        if ([[matches objectAtIndex:i] isKindOfClass:[TeamMatch class]]) {
            [results addObject:[self formatForExport:[matches objectAtIndex:i]]];
        }
    }
    return results;
}


@end
