//
//  DetailViewPresenter.m
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewPresenter.h"
#import "Event.h"

@implementation DetailViewPresenter

@synthesize events=_events;

- (DetailViewPresenter*)initWithEvents: (NSArray*)events {
    self = [super init];
    if (self) {
        self.events = events;
    }
    return self;
}

- (Event*) eventAtIndex: (NSInteger)index {
    NSArray* sorted = [self eventsSortedByName:_events];
    return [sorted objectAtIndex:index];
}

- (NSArray*) groupedEventDates {
    NSMutableArray* a = [[NSMutableArray alloc] init];
    for (Event* e in _events) {
        if (![a containsObject:e.date]) {
            [a addObject:e.date];
        }
    }
    return a;
}

- (NSArray*) getEventsByDate: (NSDate*) date {
    NSMutableArray* a = [[NSMutableArray alloc] init];
    for (Event* e in _events) {
        if ([date isEqualToDate:e.date]) {
            [a addObject:e];
        }
    }
    
    return [self eventsSortedByName:a];
}

- (NSArray*) eventsSortedByName: (NSArray*)events {
    NSSortDescriptor *sortDescriptor = [[[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES] autorelease];
    return [events sortedArrayUsingDescriptors:[NSArray arrayWithObject:sortDescriptor]];
}

- (NSInteger) numberOfSections {
    return (NSInteger) [[self groupedEventDates] count];
}

- (NSInteger) numberOfRowsInSection: (NSInteger)section {
    NSDate* d = [[self groupedEventDates] objectAtIndex:section];
    return [[self getEventsByDate:d] count];
}

- (NSString*) sectionName: (NSInteger)section {
    NSDate* date = [[self groupedEventDates] objectAtIndex:section];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"MMMM dd' at 'hh':'mm a"];
    NSString *key = [f stringFromDate:date];
    [f release];
    return key;
}

@end
