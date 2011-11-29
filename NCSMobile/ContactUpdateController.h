//
//  ContactDetailController.h
//  NCSMobile
//
//  Created by John Dzak on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleTableController.h"
#import "SimpleTableRowDelegate.h"

@class Contact;

@interface ContactUpdateController : UIViewController {
    Contact* _detailItem;
}

@property (nonatomic, retain) Contact* detailItem;

- (void)configureView;
- (void)setDetailItem:(Contact*)newDetailItem;


@end
