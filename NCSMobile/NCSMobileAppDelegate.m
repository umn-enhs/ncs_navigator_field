//
//  NCSMobileAppDelegate.m
//  NCSMobile
//
//  Created by John Dzak on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NCSMobileAppDelegate.h"

#import "RootViewController.h"
#import "LoginController.h"
#import <RestKit/RestKit.h>
#import "Event.h"
#import "Dwelling.h"
#import "Person.h"
#import "Instrument.h"
#import "Address.h"
#import "NUResponseSet.h"

@implementation NCSMobileAppDelegate


@synthesize window=_window;

@synthesize splitViewController=_splitViewController;

@synthesize rootViewController=_rootViewController;

@synthesize detailViewController=_detailViewController;

@synthesize managedObjectContext=__managedObjectContext;
@synthesize managedObjectModel=__managedObjectModel;
@synthesize persistentStoreCoordinator=__persistentStoreCoordinator;
@synthesize surveyController=_surveyController;
@synthesize sectionController=_sectionController;


- (void)addMappingsToObjectManager:(RKObjectManager *)objectManager  {
    // Dwelling Mapping
      RKObjectMapping* dwellingMapping = [RKObjectMapping mappingForClass:[Dwelling class]];
    [dwellingMapping mapKeyPathsToAttributes: 
        @"id", @"id",
        nil];
    
    RKObjectMapping *addressMapping = [RKObjectMapping mappingForClass:[Address class]];
    [addressMapping mapKeyPathsToAttributes:
        @"street", @"street",
        @"city", @"city",
        @"state", @"state",
        @"zipcode", @"zipcode",
        nil];
    
    [dwellingMapping mapRelationship:@"address" withMapping:addressMapping];
    
    // Person Mapping
    RKObjectMapping* personMapping = [RKObjectMapping mappingForClass:[Person class]];
    [personMapping mapKeyPathsToAttributes: 
     @"id", @"id",
     @"name", @"name",
     @"home_phone", @"homePhone",
     @"cell_phone", @"cellPhone",
     @"email", @"email",
     nil];
    
    // Instrument Mapping
    RKObjectMapping* instrumentMapping = [RKObjectMapping mappingForClass:[Instrument class]];
    [instrumentMapping mapKeyPathsToAttributes: 
     @"id", @"id",
     @"version", @"version",
     @"name", @"name",
     nil];
    
    // Event Mapping
    RKObjectMapping* eventMapping = [RKObjectMapping mappingForClass:[Event class]];
    [eventMapping mapKeyPathsToAttributes: 
        @"id", @"id",
        @"name", @"name",
        @"date", @"date",
        nil];
    
    // Event associations
    [eventMapping mapRelationship:@"dwelling" withMapping:dwellingMapping];
    [eventMapping mapRelationship:@"person" withMapping:personMapping];
    [eventMapping mapRelationship:@"instruments" withMapping:instrumentMapping];

    
    // "2005-07-16T19:20+01:00",
    //http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/DataFormatting/Articles/dfDateFormatting10_4.html#//apple_ref/doc/uid/TP40002369
    [RKObjectMapping addDefaultDateFormatterForString:@"yyyy'-'MM'-'dd'T'HH':'mm'Z'" inTimeZone:nil];
    [RKObjectMapping addDefaultDateFormatterForString:@"yyyy-MM-dd'T'hh:mm:ssZZ" inTimeZone:nil]; 
    [RKObjectMapping addDefaultDateFormatterForString:@"yyyy-MM-dd'T'hh:mmZZ" inTimeZone:nil]; 
    [RKObjectMapping addDefaultDateFormatterForString:@"yyyy-MM-dd'T'hh:mmZ" inTimeZone:nil]; 
//	[eventMapping.dateFormatStrings addObject:@"yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"];
    
    // Register our mappings with the provider
    [objectManager.mappingProvider setMapping:eventMapping forKeyPath:@"events"];

}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // TODO: These mappings should be in their own mapping class
    
    // Initialize RestKit
	RKObjectManager* objectManager = [RKObjectManager objectManagerWithBaseURL:@"http://localhost:4567"];
    
    // Enable automatic network activity indicator management
    [RKRequestQueue sharedQueue].showsNetworkActivityIndicatorWhenBusy = YES;
    
    [self addMappingsToObjectManager: objectManager];


    // Override point for customization after application launch.
    // Add the split view controller's view to the window and display.
    self.window.rootViewController = self.splitViewController;
    [self.window makeKeyAndVisible];
    
    //    
    LoginController *login = [[LoginController alloc] init];
    [self.rootViewController.navigationController presentModalViewController:login animated:NO];
    [login release];

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
    [__managedObjectContext release];
    [__managedObjectModel release];
    [__persistentStoreCoordinator release];
    [_splitViewController release];
    [_surveyController release];
    [_sectionController release];
    [super dealloc];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil)
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            /*
             Replace this implementation with code to handle the error appropriately.
             
             abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
             */
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}
- (void) saveContext:(NSString *)triggeredBy {
	// Save the context.
	NSError *error = nil;
	if (![self.managedObjectContext save:&error]) {
		/*
		 Replace this implementation with code to handle the error appropriately.
		 abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
		 */
		[UIAppDelegate errorWithTitle:@"Save error" message:[NSString stringWithFormat:@"Unresolved %@ error %@, %@", triggeredBy, error, [error userInfo]]];
	}
}
- (void) errorWithTitle:(NSString *)errorTitle message:(NSString *)errorMessage{
	DLog(@"%@: %@", errorTitle, errorMessage);
	UIAlertView *errorAlert = [[[UIAlertView alloc] initWithTitle:errorTitle message:errorMessage delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] autorelease];
	[errorAlert show];
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

/**
 Returns the managed object context for the application.
 If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
 */
- (NSManagedObjectContext *)managedObjectContext
{
    if (__managedObjectContext != nil)
    {
        return __managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil)
    {
        __managedObjectContext = [[NSManagedObjectContext alloc] init];
        [__managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return __managedObjectContext;
}

/**
 Returns the managed object model for the application.
 If the model doesn't already exist, it is created from the application's model.
 */
- (NSManagedObjectModel *)managedObjectModel
{
    if (__managedObjectModel != nil)
    {
        return __managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"NCSMobile" withExtension:@"momd"];
    __managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];    
    return __managedObjectModel;
}

/**
 Returns the persistent store coordinator for the application.
 If the coordinator doesn't already exist, it is created and the application's store added to it.
 */
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (__persistentStoreCoordinator != nil)
    {
        return __persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"NCSMobile.sqlite"];
    
    NSError *error = nil;
    __persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![__persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error])
    {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. If it is not possible to recover from the error, display an alert panel that instructs the user to quit the application by pressing the Home button.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter: 
         [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption, [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    // iOS 4 encryption
    if(RSRunningOnOS4OrBetter()){
        NSDictionary *fileAttributes = [NSDictionary dictionaryWithObject:NSFileProtectionComplete forKey:NSFileProtectionKey];
        if(![[NSFileManager defaultManager] setAttributes:fileAttributes ofItemAtPath:storeURL.path error:&error]){
            // Handle error
        }
    }
    
    return __persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


@end
