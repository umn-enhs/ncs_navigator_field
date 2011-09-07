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

- (NSArray*) groupedEventTimes {
    NSMutableArray* a = [[NSMutableArray alloc] init];
    for (Event* e in _events) {
        if (![a containsObject:e.date]) {
            [a addObject:e.date];
        }
    }
    return a;
}
//
- (NSArray*) getEventsByDate: (NSDate*) date {
    NSMutableArray* a = [[NSMutableArray alloc] init];
    for (Event* e in _events) {
        if ([date isEqualToDate:e.date]) {
            [a addObject:e];
        }
    }
    return a;
}

@end
