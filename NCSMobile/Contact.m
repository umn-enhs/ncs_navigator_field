//
//  Contact.m
//  NCSMobile
//
//  Created by John Dzak on 9/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Contact.h"
#import "Event.h"

@implementation Contact

@synthesize startDate=_startDate;
@synthesize person=_person;
@synthesize events=_events;

- (Contact*) initWithEvent:(Event*)event {
    if (self = [super init]) {
        self.person = [event.person copy];
        self.startDate = [event.date copy];
        [self addEvent:event];
    }
    return self;
}

- (void) addEvent: (Event*)event {
    if (_events == NULL) {
        self.events = [[NSMutableArray alloc] init];
    }
    [self.events addObject:event];
}

- (void) dealloc {
    [_startDate release];
    [_person release];
    [_events release];
    [super dealloc];
}

@end
