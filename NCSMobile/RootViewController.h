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

@class ContactDisplayController;
@class Instrument;
@class CasProxyTicket;

@interface RootViewController : SimpleTableController<RKObjectLoaderDelegate,UINavigationControllerDelegate, SimpleTableRowDelegate, CasLoginDelegate> {
    Instrument* _administeredInstrument;
}

		
@property (nonatomic, retain) IBOutlet ContactDisplayController *detailViewController;

- (void)purgeSurveyor;
- (void) loadSurveyor:(Instrument*)instrument;
- (void) didSelectRow:(Row*)row;
- (void)loadDataWithProxyTicket:(CasProxyTicket*)ticket;
- (void)loadObjectsFromDataStore;
- (void)reloadButtonWasPressed;
- (void) deleteButtonWasPressed;
- (void) unloadSurveyor:(Instrument*)instrument responseSet:(NUResponseSet*)rs;

- (void)successfullyObtainedServiceTicket:(CasServiceTicket*)serviceTicket;

@end
