//
//  ContactPresenter.m
//  NCSMobile
//
//  Created by John Dzak on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactPresenter.h"
#import "Contact.h"
#import "Section.h"
#import "Row.h"
#import "Person.h"
#import "Event.h"
#import "Dwelling.h"
#import "Address.h"

@implementation ContactPresenter

@synthesize contact=_contact;
@synthesize sections=_sections;

- (id)initUsingContact:(Contact*)contact {
    self = [super init];
    if (self) {
        self.contact = contact;
        self.sections = [self buildSectionsFromContact:contact];
    }
    
    return self;
}

- (NSArray*) buildSectionsFromContact:(Contact*)contact {
    Section *titleSection = [Section new];
    titleSection.name = contact.person.name;
    
    Section *addressSection = [Section new];
    Row *ar = [Row new];
    ar.text = @"Address";
    Event *e0 = [contact.events objectAtIndex:0];
    Address *a = e0.dwelling.address;
    ar.detailText = [NSString stringWithFormat:@"%@\n%@, %@ %@", a.street, a.city, a.state, a.zipcode];
    [addressSection addRow:ar];
    
    Section *instrumentSection = [Section new];
    for (Event *e in contact.events) {
        Row *r = [Row new];
        r.text = e.name;
        [instrumentSection addRow:r];
    }
     
    return [NSArray arrayWithObjects:titleSection, addressSection, instrumentSection, nil];
}

- (void) dealloc {
    [_contact release];
    [_sections release];
    [super dealloc];
}

@end
