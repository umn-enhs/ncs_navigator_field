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
#import "Event.h"
#import "Dwelling.h"
#import "Person.h"
#import "Instrument.h"
#import "Address.h"

@implementation NCSMobileAppDelegate


@synthesize window=_window;

@synthesize splitViewController=_splitViewController;

@synthesize rootViewController=_rootViewController;

@synthesize detailViewController=_detailViewController;

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
    [_rootViewController release];
    [_detailViewController release];
    [super dealloc];
}

@end
