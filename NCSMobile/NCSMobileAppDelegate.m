//
//  NCSMobileAppDelegate.m
//  NCSMobile
//
//  Created by John Dzak on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NCSMobileAppDelegate.h"

#import "RootViewController.h"
#import <RestKit/RestKit.h>
#import <RestKit/CoreData/CoreData.h>
#import "Event.h"
#import "Person.h"
#import "Instrument.h"
#import "Address.h"
#import "Location.h"
#import "NUResponseSet.h"
#import "Contact.h"
#import "InstrumentTemplate.h"
#import "Configuration.h"

@implementation NCSMobileAppDelegate


@synthesize window=_window;

@synthesize splitViewController=_splitViewController;

@synthesize rootViewController=_rootViewController;

@synthesize detailViewController=_detailViewController;

@synthesize surveyController=_surveyController;
@synthesize sectionController=_sectionController;


- (void)addMappingsToObjectManager:(RKObjectManager *)objectManager  {
    // Instrument Template
    RKManagedObjectMapping* instrumentTemplate = [RKManagedObjectMapping mappingForClass:[InstrumentTemplate class]];
    [instrumentTemplate mapKeyPathsToAttributes:
     @"id", @"identifier",
     @"representation", @"representation", nil];
    [instrumentTemplate setPrimaryKeyAttribute:@"identifier"];
    [objectManager.mappingProvider setMapping:instrumentTemplate forKeyPath:@"instrument_templates"];
    
    // Instrument Mapping
    RKManagedObjectMapping* instrument = [RKManagedObjectMapping mappingForClass:[Instrument class]];
    [instrument mapKeyPathsToAttributes: 
        @"instrument_template_id", @"instrumentTemplateId", 
        @"name", @"name", nil];
    [instrument mapRelationship:@"instrumentTemplate" withMapping:instrumentTemplate];
    [instrument connectRelationship:@"instrumentTemplate" withObjectForPrimaryKeyAttribute:@"instrumentTemplateId"];
    
    // Event Mapping
    RKManagedObjectMapping* event = [RKManagedObjectMapping mappingForClass:[Event class]];
    [event mapKeyPathsToAttributes: 
        @"name", @"name", nil];
    [event mapRelationship:@"instruments" withMapping:instrument];
    
    // Address Mapping
    RKManagedObjectMapping *address = [RKManagedObjectMapping mappingForClass:[Address class]];
    [address mapKeyPathsToAttributes:
        @"street", @"street",
        @"city", @"city",
        @"state", @"state",
        @"zip_code", @"zipCode", nil];

    // Location Mapping
    RKManagedObjectMapping* location = [RKManagedObjectMapping mappingForClass:[Location class]];
    [location mapKeyPathsToAttributes:
        @"code", @"code",
        @"other", @"other",
        @"details", @"details", nil];
    [location mapRelationship:@"address" withMapping:address];
    
    // Person Mapping
    RKManagedObjectMapping* person = [RKManagedObjectMapping mappingForClass:[Person class]];
    [person mapKeyPathsToAttributes: 
        @"id", @"id",
        @"name", @"name",
        @"home_phone", @"homePhone",
        @"cell_phone", @"cellPhone",
        @"email", @"email", nil];
    
    // Contact Mapping
    RKManagedObjectMapping* contact = [RKManagedObjectMapping mappingForClass:[Contact class]];
    [contact mapKeyPathsToAttributes:
        @"type", @"typeId", 
        @"start_date", @"startDate",
        @"end_date", @"endDate", nil];
    [contact mapRelationship:@"person" withMapping:person];
    [contact mapRelationship:@"location" withMapping:location];
    [contact mapRelationship:@"events" withMapping:event];
    [objectManager.mappingProvider setMapping:contact forKeyPath:@"contacts"];
    
    // "2005-07-16T19:20+01:00",
    //http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369
    [RKManagedObjectMapping addDefaultDateFormatterForString:@"yyyy'-'MM'-'dd'T'HH':'mm'Z'" inTimeZone:nil];
    [RKManagedObjectMapping addDefaultDateFormatterForString:@"yyyy-MM-dd'T'hh:mm:ssZZ" inTimeZone:nil]; 
    [RKManagedObjectMapping addDefaultDateFormatterForString:@"yyyy-MM-dd'T'hh:mmZZ" inTimeZone:nil]; 
    [RKManagedObjectMapping addDefaultDateFormatterForString:@"yyyy-MM-dd'T'hh:mmZ" inTimeZone:nil]; 
//	[eventMapping.dateFormatStrings addObject:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // TODO: These mappings should be in their own mapping class
    // Initialize RestKit
    NSString* coreURL = [Configuration instance].coreURL;
	RKObjectManager* objectManager = [RKObjectManager objectManagerWithBaseURL:coreURL];
    
    // Initialize store
    RKManagedObjectStore* objectStore = [RKManagedObjectStore objectStoreWithStoreFilename:@"main.sqlite" usingSeedDatabaseName:nil managedObjectModel:nil delegate:self];
    objectManager.objectStore = objectStore;
    NSManagedObjectContext* restkitMoc = objectStore.managedObjectContext;
    
    // Setup Data Protection
    // iOS 4 encryption
    NSError *error = nil;
    if(RSRunningOnOS4OrBetter()){
        NSDictionary *fileAttributes = [NSDictionary dictionaryWithObject:NSFileProtectionComplete forKey:NSFileProtectionKey];
        if(![[NSFileManager defaultManager] setAttributes:fileAttributes ofItemAtPath:objectStore.pathToStoreFile error:&error]){
            NSLog(@"Data protection is not enabled for %@", objectStore.pathToStoreFile);
        }
    }

    // Set Undo Manager
    NSUndoManager *undoManager = [[[NSUndoManager alloc] init] autorelease];
    [restkitMoc setUndoManager:undoManager];
    
    
    // Enable automatic network activity indicator management
    [RKClient sharedClient].requestQueue.showsNetworkActivityIndicatorWhenBusy = YES;
    
    [self addMappingsToObjectManager: objectManager];


    // Override point for customization after application launch.
    // Add the split view controller's view to the window and display.
    self.window.rootViewController = self.splitViewController;
    [self.window makeKeyAndVisible];
    
    //    

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- (void)dealloc
{
    [_window release];
    [_splitViewController release];
    [_surveyController release];
    [_sectionController release];
    [super dealloc];
}

#pragma mark - Core Data stack
BOOL RSRunningOnOS4OrBetter(void) {
    static BOOL didCheckIfOnOS4 = NO;
    static BOOL runningOnOS4OrBetter = NO;
    return runningOnOS4OrBetter;
    
    if(!didCheckIfOnOS4){
        NSString *systemVersion = [UIDevice currentDevice].systemVersion;
        NSInteger majorSystemVersion = 3;
        if(systemVersion != nil && [systemVersion length] > 0){
            NSString *firstCharacter = [systemVersion substringToIndex:1];
            majorSystemVersion = [firstCharacter integerValue];
        }
        
        runningOnOS4OrBetter = (majorSystemVersion >= 4);
        didCheckIfOnOS4 = YES;
    }
    
    return runningOnOS4OrBetter;
}

@end
