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
@class Instrument;

@interface RootViewController : SimpleTableController<RKObjectLoaderDelegate,UINavigationControllerDelegate, SimpleTableRowDelegate> {
    Instrument* _administeredInstrument;
}

		
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

- (void) loadSurveyor:(Instrument*)instrument;
- (void) didSelectRow:(Row*)row;
- (void)loadData;
- (void)loadObjectsFromDataStore;
- (void)reloadButtonWasPressed;
- (void) deleteButtonWasPressed;
- (void) unloadSurveyor:(Instrument*)instrument responseSet:(NUResponseSet*)rs;

@end
