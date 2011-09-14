//
//  DetailViewPresenter.m
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewPresenter.h"
#import "Event.h"
#import "Contact.h"

@implementation DetailViewPresenter

@synthesize events=_events;

- (DetailViewPresenter*)initWithEvents: (NSArray*)events {
    self = [super init];
    if (self) {
        self.events = events;
    }
    return self;
}

- (Contact*) contactInSection:(NSInteger)section index: (NSInteger)index {
    NSDate *date = [[self contactDates] objectAtIndex:section];
    return [[self contactsWithDate:date] objectAtIndex:index];
}

- (NSArray*) buildContactsFromEvents {
    NSArray *sorted = [self sortEventsByDateAndPersonName:_events];
    NSMutableArray *contacts = [[NSMutableArray alloc] init];
    for (Event *e in sorted) {
        Contact *last = [contacts lastObject];
        if ([last isEventPartOfContact: e]) {
            [last addEvent:e];
        } else {
            Contact *c = [[Contact alloc]initWithEvent:e];
            [contacts addObject:c];
        }
    }
    return contacts;
}

- (NSArray*) sortEventsByDateAndPersonName:(NSArray*)events {
    NSSortDescriptor *date = [[[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES] autorelease];
    NSSortDescriptor *name = [[[NSSortDescriptor alloc] initWithKey:@"person.name" ascending:YES] autorelease];
    return [events sortedArrayUsingDescriptors:[NSArray arrayWithObjects:date, name, nil]];
}

- (NSInteger) numberOfSections {
    return [[self contactDates] count];
}

- (NSArray*) contactDates {
    NSMutableArray* dates = [[NSMutableArray alloc] init];
    for (Event *e in _events) {
        if (![dates containsObject:e.date]) {
            [dates addObject:e.date];
        }
    }
    return dates;
}

- (NSInteger) numberOfRowsInSection: (NSInteger)section {
    NSDate *date = [[self contactDates] objectAtIndex:section];
    return [[self contactsWithDate:date] count];
}

- (NSArray*) contactsWithDate:(NSDate*)date {
    NSArray *filtered = [_events filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"date == %@", date]];
    NSMutableArray *contacts = [[NSMutableArray alloc] init];
    for (Event* e in [self sortEventsByDateAndPersonName:filtered]) {
        Contact* last = [contacts lastObject];
        if ([last isEventPartOfContact:e]) {
            [last addEvent:e];
        } else {
            Contact *new = [[Contact alloc] initWithEvent:e];
            [contacts addObject:new];
        }
    }
    return contacts;
}

- (NSString*) sectionName: (NSInteger)section {
    NSArray *dates = [self contactDates];
    [dates sortedArrayUsingSelector:@selector(compare:)];
  
    NSDate* date = [dates objectAtIndex:section];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"MMMM dd' at 'hh':'mm a"];
    NSString *key = [f stringFromDate:date];
    [f release];
    return key;
}

@end
