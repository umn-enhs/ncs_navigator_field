//
//  ContactPresenter.m
//  NCSMobile
//
//  Created by John Dzak on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactTable.h"
#import "Contact.h"
#import "Section.h"
#import "Row.h"
#import "Person.h"
#import "Event.h"
#import "Dwelling.h"
#import "Address.h"

@implementation ContactTable

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
    return [NSArray arrayWithObjects: 
                [self addresses], 
                [self phones], 
                [self emails], 
                [self instruments], 
                nil];
}

- (Section*) addresses {
    Row *home = [[Row alloc] initWithText:@"Home"];
    
    // TODO: Data shouldn't be structured like this
    Event *e0 = [self.contact.events objectAtIndex:0];
    Address *a = e0.dwelling.address;
    home.detailText = [NSString stringWithFormat:@"%@\n%@, %@ %@", a.street, a.city, a.state, a.zipcode];
    
    return [[[Section alloc] initWithRows:home, nil] autorelease];
}

- (Section*) phones {
    Row* home = [[[Row alloc] initWithText:@"Home" detailText:self.contact.person.homePhone] autorelease];
    Row* cell = [[[Row alloc] initWithText:@"Cell" detailText:self.contact.person.cellPhone] autorelease];
    
    return [[[Section alloc] initWithRows:home, cell, nil] autorelease];
}

- (Section*) emails {
    Row* home =[[Row alloc] initWithText:@"Home" detailText:self.contact.person.email];
    return [[[Section alloc] initWithRows:home, nil] autorelease];
}

- (Section*) instruments {
    Section *instruments = [[Section new] autorelease];
    instruments.name = @"Instruments";
    for (Event *e in self.contact.events) {
        Row *r = [Row new];
        r.text = e.name;
        [instruments addRow:r];
    }
    return instruments;
}

- (void) dealloc {
    [_contact release];
    [_sections release];
    [super dealloc];
}

@end
