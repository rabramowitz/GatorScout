//
//  SearchViewController.m
//  Scouting3
//
//  Created by Carly Robison on 3/6/14.
//  Copyright (c) 2014 Gatorbotics. All rights reserved.
//

#import "SearchViewController.h"
#import "GTBXViewController.h"
#import "SearchResultsTableViewController.h"

@interface SearchViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *resultsButton;

@end

@implementation SearchViewController

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
    appDelegate = [[UIApplication sharedApplication] delegate];
    if (!self.results) {
        self.results = [[NSMutableArray alloc] init]; // lazy instantiation
    }
    if (!self.teamNumberField.text) {
        self.teamNumberField.text = @"";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender == _resultsButton){
        NSLog(@"going to results view");
        if ([self.teamNumberField.text isEqual:@""]) {
            [self searchForAll];
        } else {
            [self searchForMatching];
        }
        appDelegate.searchResults = self.results;
    }
}


- (IBAction)clearData:(id)sender {
    NSLog(@"buttonReset Pressed");
    
    //Erase the persistent store from coordinator and also file manager.
    NSPersistentStore *store = [appDelegate.persistentStoreCoordinator.persistentStores lastObject];
    NSError *error = nil;
    NSURL *storeURL = store.URL;
    [appDelegate.persistentStoreCoordinator removePersistentStore:store error:&error];
    [[NSFileManager defaultManager] removeItemAtURL:storeURL error:&error];
    
    //make new persistent store
    if (![appDelegate.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // do something with the error
    }
    NSLog(@"Data Reset");
}

- (void)searchForAll
{
    [self.results removeAllObjects];
    
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"DTeammatches"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setResultType:NSDictionaryResultType];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"teamNumber" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    for (int itemNum = 0; itemNum < [objects count]; itemNum++) {
        NSManagedObject *object;
        object = [objects objectAtIndex:itemNum];
        [self.results addObject:[self pullTeamMatchDataFromManagedObject:object]];
    }
}

- (void)searchForMatching
{
    [self.results removeAllObjects];
    NSManagedObjectContext *context =
    [appDelegate managedObjectContext];
    
    NSEntityDescription *entityDesc =
    [NSEntityDescription entityForName:@"DTeammatches"
                inManagedObjectContext:context];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entityDesc];
    [request setResultType:NSDictionaryResultType];
    
    NSPredicate *pred =
    [NSPredicate predicateWithFormat:@"(teamNumber == %@)",
     self.teamNumberField.text];
    [request setPredicate:pred];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"matchNumber" ascending:YES];
    [request setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *objects = [context executeFetchRequest:request
                                              error:&error];
    
    for (int itemNum = 0; itemNum < [objects count]; itemNum++) {
        NSManagedObject *object;
        object = [objects objectAtIndex:itemNum];
        [self.results addObject:[self pullTeamMatchDataFromManagedObject:object]];

    }
}

-(TeamMatch *)pullTeamMatchDataFromManagedObject:(NSManagedObject *)object {
    TeamMatch *thisTeam;
    thisTeam = [[TeamMatch alloc] init];
    thisTeam.alliance = [object valueForKey:@"alliance"];
    thisTeam.teamNumber = [object valueForKey:@"teamNumber"];
    thisTeam.matchNumber = [object valueForKey:@"matchNumber"];
    thisTeam.autoMadeHG = [[object valueForKey:@"autoMadeHG"] intValue];
    thisTeam.autoMadeLG = [[object valueForKey:@"autoMadeLG"] intValue];
    thisTeam.autoMissedHG = [[object valueForKey:@"autoMissedHG"] intValue];
    thisTeam.autoMissedLG = [[object valueForKey:@"autoMissedLG"] intValue];
    thisTeam.autoMoved = [[object valueForKey:@"autoMoved"] boolValue];
    thisTeam.teleopCaught = [[object valueForKey:@"teleopCaught"] intValue];
    thisTeam.teleopMadeHG = [[object valueForKey:@"teleopMadeHG"] intValue];
    thisTeam.teleopMadeLG = [[object valueForKey:@"teleopMadeLG"] intValue];
    thisTeam.teleopMissedHG = [[object valueForKey:@"teleopMissedHG"] intValue];
    thisTeam.teleopMissedLG = [[object valueForKey:@"teleopMissedLG"] intValue];
    thisTeam.teleopPassed = [[object valueForKey:@"teleopPassed"] intValue];
    thisTeam.teleopPosessions = [[object valueForKey:@"teleopPosessions"] intValue];
    thisTeam.teleopTrussMade = [[object valueForKey:@"teleopTrussMade"] intValue];
    thisTeam.teleopTrussMissed = [[object valueForKey:@"teleopTrussMissed"] intValue];
    thisTeam.teleopDefensive = [[object valueForKey:@"teleopDefensive"] intValue];
    thisTeam.teleopDropped = [[object valueForKey:@"teleopDropped"] intValue];
    thisTeam.broken = [[object valueForKey:@"broken"] boolValue];
    thisTeam.penalties = [[object valueForKey:@"penalties"] intValue];
    thisTeam.timestamp = [object valueForKey:@"timestamp"];
    thisTeam.tournamentName = [object valueForKey:@"tournamentName"];
    thisTeam.scoutName = [object valueForKey:@"scoutName"];
    thisTeam.notes = [object valueForKey:@"notes"];
    return thisTeam;
}

- (IBAction)textChanged:(id)sender {
    [self.teamNumberField resignFirstResponder];
    [self.matchNumberField resignFirstResponder];
}


@end
