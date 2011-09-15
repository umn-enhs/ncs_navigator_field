//
//  DetailViewPresenter.m
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactNavigationPresenter.h"
#import "Event.h"
#import "Contact.h"
#import "ContactManager.h"
#import "Section.h"
#import "Row.h"
#import "Person.h"

@implementation ContactNavigationPresenter

@synthesize events=_events;
@synthesize contacts=_contacts;
@synthesize sections=_sections;

- (ContactNavigationPresenter*)initWithEvents: (NSArray*)events {
    self = [super init];
    if (self) {
        self.events = events;
        self.contacts = [ContactManager coalesce:[Contact contactsFromEventsArray:events]];
        self.sections = [self buildSectionsUsingContacts:self.contacts];
    }
    return self;
}

- (NSArray*) buildSectionsUsingContacts:(NSArray*) contacts {
    NSMutableArray* sections = [NSMutableArray new];
    NSSet *uniqueDates = [NSCountedSet setWithArray:[contacts valueForKey:@"startDate"]];
    for (NSDate *d in uniqueDates) {
        Section *s = [Section new];
        s.name = [self buildSectionNameUsingDate:d];
        
        NSPredicate *findByDate = [NSPredicate predicateWithFormat:@"startDate == %@", d];
        NSArray *found = [contacts filteredArrayUsingPredicate:findByDate];
        s.rows = [self buildRowsUsingContacts:found];
        
        [sections addObject:s];
    }
    return sections;
}

                  
- (NSString*) buildSectionNameUsingDate:(NSDate*)date {
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"MMMM dd' at 'hh':'mm a"];
    NSString *name = [f stringFromDate:date];
    [f release];
    return name;
}

- (NSArray*) buildRowsUsingContacts:(NSArray*)contacts {
    NSMutableArray *rows = [NSMutableArray new];
    for (Contact *c in contacts) {
        Row *r = [Row new];
        r.text = c.person.name;
        r.subText = [NSString stringWithFormat:@"%@ instruments", [NSNumber numberWithInt:[c.events count]]];
        [rows addObject:r];
    }
    return rows;
}
@end
