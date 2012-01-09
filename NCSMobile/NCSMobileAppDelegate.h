//
//  NCSMobileAppDelegate.h
//  NCSMobile
//
//  Created by John Dzak on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NUSectionVC.h"
#import "NUSurveyVC.h"
#import "NUCas.h"

@class RootViewController;


@class ContactDisplayController;

@interface NCSMobileAppDelegate : NSObject <UIApplicationDelegate> {
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;

@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;

@property (nonatomic, retain) IBOutlet ContactDisplayController *detailViewController;

/* imported for surveyor_ios */
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

- (void) saveContext:(NSString *)triggeredBy;
- (void) errorWithTitle:(NSString *)errorTitle message:(NSString *)errorMessage;

@property (nonatomic, retain) IBOutlet NUSurveyVC *surveyController;
@property (nonatomic, retain) NUSectionVC *sectionController;
/* */

@end
