//
//  RootViewController.h
//  NCSMobile
//
//  Created by John Dzak on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "SimpleTableController.h"
#import "SimpleTableRowDelegate.h"

@class DetailViewController;

@interface RootViewController : SimpleTableController<RKObjectLoaderDelegate,UINavigationControllerDelegate, SimpleTableRowDelegate> {
}

		
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

- (void) loadSurveyor;
- (void) didSelectRow:(Row*)row;
- (void)reloadButtonWasPressed:(id)sender;
- (void)loadData;
- (void)loadObjectsFromDataStore;

@end
