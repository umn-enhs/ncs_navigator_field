//
//  RootViewController.m
//  NCSMobile
//
//  Created by John Dzak on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#import "ContactDisplayController.h"
#import "ContactNavigationTable.h"
#import "Event.h"
#import "Contact.h"
#import "Section.h"
#import "Row.h"
#import "NUSurveyVC.h"
#import "NUSectionVC.h"
#import "NUResponseSet.h"
#import "Instrument.h"
#import "InstrumentTemplate.h"
#import "SBJsonWriter.h"
#import "NUResponseSet.h"

@interface RootViewController () 
    @property(nonatomic,retain) NSArray* contacts;
    @property(nonatomic,retain) ContactNavigationTable* table;
@end

@implementation RootViewController
		
@synthesize detailViewController=_detailViewController;
@synthesize contacts=_contacts;
@synthesize table=_table;

#pragma surveyor
- (void) loadSurveyor:(Instrument*)instrument {
    if (instrument != NULL) {
        NSString* survey = instrument.instrumentTemplate.json;
        
        
        //TODO: Pass response set id to load existing if exists
        NUResponseSet* rs = NULL;
        if (instrument.externalResponseSetId != NULL) {
            NSManagedObjectContext* moc = UIAppDelegate.managedObjectContext;
            NSEntityDescription *desc = [NSEntityDescription entityForName:@"ResponseSet" inManagedObjectContext:moc];
            NSFetchRequest *req = [[[NSFetchRequest alloc] init] autorelease];
            
            [req setEntity:desc];
            
            NSPredicate *p = [NSPredicate predicateWithFormat:
                                      @"uuid = %@", instrument.externalResponseSetId];
            
            [req setPredicate:p];
            
            NSError *error = nil;
            
            NSArray *array = [moc executeFetchRequest:req error:&error];
            
            if (array == nil)
            {
                NSLog(@"Error during fetch");                
            } else {
                NSLog(@"fetched response set: %@", array);
                rs = [[array objectEnumerator] nextObject];
            }
        }
        
        //
        
        NUSurveyVC *surveyController = [[NUSurveyVC alloc] init];
        surveyController.surveyJSONRepresentation = survey;
        surveyController.responseSet = rs;
        NUSectionVC *sectionController = [[NUSectionVC alloc] init];
        surveyController.sectionController = sectionController;
        UIAppDelegate.sectionController = sectionController;
        [self.navigationController pushViewController:surveyController animated:NO];
        
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:self.navigationController, sectionController, nil];
        _administeredInstrument = instrument;
    }
}

//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    NSLog(@"willShowViewController");
//}

#pragma mark -
#pragma mark navigation controller delegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    Class src = [[self.splitViewController.viewControllers objectAtIndex:1] class];
    Class dst = [viewController class];
    if ( src == [NUSectionVC class] &&  dst == [RootViewController class]) {
        NUSectionVC* sectionVC = (NUSectionVC*) [self.splitViewController.viewControllers objectAtIndex:1];
        NUResponseSet* rs = sectionVC.responseSet;
        if (rs != NULL) {
            [self unloadSurveyor:_administeredInstrument responseSet:rs];
            _administeredInstrument = NULL;
        }
        
        self.splitViewController.viewControllers = [NSArray arrayWithObjects:self.navigationController, _detailViewController, nil];
    }    
}

- (void) unloadSurveyor:(Instrument*)instrument responseSet:(NUResponseSet*)rs {
//    NSLog(@"Response set: %@", rs);
    NSLog(@"Response set uuid: %@", rs.uuid);
//    NSLog(@"Administered instrument: %@", instrument);
    
    NSManagedObjectContext* moc = [instrument managedObjectContext];
    instrument.externalResponseSetId = rs.uuid;
    NSError *error = nil;
    
    if (![moc save:&error]) {
        NSLog(@"Error saving instrument uuid");
    }
    NSLog(@"Administered instrument with external response uuid: %@", instrument);

//    [surveyorMoc 
    
}
             
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    NSLog(@"DELEGATE: switched views: message from the nav controller delegate");
}

#pragma RestKit
- (void)objectLoader:(RKObjectLoader *)loader willMapData:(inout id *)mappableData {
    SBJsonWriter *jsonWriter = [SBJsonWriter new];

    NSMutableArray* modifiedTemplates = [NSMutableArray new];
    for (NSDictionary* templ in [*mappableData valueForKey:@"instrument_templates"]) {
        NSDictionary* json = [templ valueForKey:@"json"];
        NSString *jsonString = [jsonWriter stringWithObject:json];
        NSMutableDictionary* mod = [templ mutableCopy];
        [mod setObject:jsonString forKey:@"json"];
        [modifiedTemplates addObject:mod];
    }
    [*mappableData setObject:modifiedTemplates forKey:@"instrument_templates"];    
    
    NSLog(@"Mapping Instrument Template: %@", *mappableData);
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
	NSLog(@"Loaded contacts: %@", objects);    
 
    [self loadObjectsFromDataStore];

    self.simpleTable = [[ContactNavigationTable alloc] initWithContacts:_contacts];
    
	[self.tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
	UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
	[alert show];
	NSLog(@"Hit error: %@", error);
}

#pragma Simple Table
- (void) didSelectRow:(Row*)row {
    self.detailViewController.detailItem = row.entity;
}

#pragma Actions
- (void)reloadButtonWasPressed {
    NSLog(@"Reload Pressed!!!");
    [self loadData];
//
//    RKObjectManager* objectManager = [RKObjectManager sharedManager];
//    [objectManager loadObjectsAtResourcePath:@"/staff/xyz123/contacts.json" delegate:self];
    
//    self.table = [[ContactNavigationTable alloc] initWithContacts:[NSArray arrayWithObjects: nil]];

}

- (void) deleteButtonWasPressed {
    NSLog(@"Delete button pressed");

//    NCSMobileAppDelegate* d = [[_contacts objectAtIndex:0] managedObjectContext];
    for (Contact* c in _contacts) {
        NSManagedObjectContext* ctx = [c managedObjectContext];
        [ctx deleteObject:c];
        
        NSError* error = nil;
        
        [[c managedObjectContext] save:&error];
        
        if (nil != error) {
            NSLog(@"Error while deting contact.");
        }
    }
    self.contacts = [NSArray array];
    
    self.simpleTable = [[ContactNavigationTable alloc] initWithContacts:_contacts];
    
	[self.tableView reloadData];
}

- (void)loadData {
    // Load the object model via RestKit	
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    [objectManager loadObjectsAtResourcePath:@"/staff/xyz123/contacts.json" delegate:self];
}

- (void)loadObjectsFromDataStore {
	NSFetchRequest* request = [Contact fetchRequest];
	NSSortDescriptor* descriptor = [NSSortDescriptor sortDescriptorWithKey:@"startDate" ascending:YES];
	[request setSortDescriptors:[NSArray arrayWithObject:descriptor]];
	self.contacts = [[Contact objectsWithFetchRequest:request] retain];
}

#pragma lifecycle
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//
//
//}

		
- (void) loadView {
    [super loadView];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    self.title = @"Contacts";
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reloadButtonWasPressed)] autorelease];
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteButtonWasPressed)] autorelease];
    //    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    //    [objectManager loadObjectsAtResourcePath:@"/staff/xyz123/contacts.json" delegate:self];
    //    

    [self loadObjectsFromDataStore];
    self.simpleTable = [[ContactNavigationTable alloc] initWithContacts:_contacts];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [_detailViewController release];
    [_contacts release];
    [super dealloc];
}

@end
