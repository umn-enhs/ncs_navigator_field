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
    Section *addresses = [Section new];
    Row *ar = [Row new];
    ar.text = @"Home";
    Event *e0 = [contact.events objectAtIndex:0];
    Address *a = e0.dwelling.address;
    ar.detailText = [NSString stringWithFormat:@"%@\n%@, %@ %@", a.street, a.city, a.state, a.zipcode];
    [addresses addRow:ar];
    
    Section *phones = [Section new];
    [phones addRow:[[Row alloc] initWithText:@"Home" detailText:contact.person.homePhone]];
    [phones addRow:[[Row alloc] initWithText:@"Cell" detailText:contact.person.cellPhone]];
    
    Section *emails = [Section new];

    [emails addRow:[[Row alloc] initWithText:@"Home" detailText:contact.person.email]];
    
    Section *instruments = [Section new];
    instruments.name = @"Instruments";
    for (Event *e in contact.events) {
        Row *r = [Row new];
        r.text = e.name;
        [instruments addRow:r];
    }
     
    return [NSArray arrayWithObjects: addresses, phones, emails, instruments, nil];
}

- (void) dealloc {
    [_contact release];
    [_sections release];
    [super dealloc];
}

@end
