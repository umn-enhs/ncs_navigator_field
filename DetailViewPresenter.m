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

- (Contact*) contactAtIndex: (NSInteger)index {
    NSArray *contacts = [self buildContactsFromEvents];
    return [contacts objectAtIndex:index];
}

- (NSArray*) buildContactsFromEvents {
    NSArray *sorted = [self eventsSortedByDateAndPersonName];
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

- (NSArray*) eventsSortedByDateAndPersonName {
    NSSortDescriptor *date = [[[NSSortDescriptor alloc] initWithKey:@"date" ascending:YES] autorelease];
    NSSortDescriptor *name = [[[NSSortDescriptor alloc] initWithKey:@"person.name" ascending:YES] autorelease];
    return [_events sortedArrayUsingDescriptors:[NSArray arrayWithObjects:date, name, nil]];
}

- (NSInteger) numberOfSections {
//    return (NSInteger) [[self groupedEventDates] count];
    return 0;
}


- (NSInteger) numberOfRowsInSection: (NSInteger)section {
    return 0;
}

- (NSString*) sectionName: (NSInteger)section {
    return @"Section";
}

@end
