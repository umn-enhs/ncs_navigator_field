//
//  DetailViewController.h
//  NCSMobile
//
//  Created by John Dzak on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleTableController.h"
#import "SimpleTableRowDelegate.h"

@class Contact;
@class ContactTable;
@class ContactDetailController;

@interface DetailViewController : SimpleTableController <UIPopoverControllerDelegate, UISplitViewControllerDelegate, SimpleTableRowDelegate> {
    ContactDetailController* _contactDetailController;
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) Contact* detailItem;
@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventDateLabel;
@property (nonatomic, retain) IBOutlet UILabel* dwellingIdLabel;

@property(nonatomic, retain) IBOutlet ContactDetailController* contactDetailController;

@end
