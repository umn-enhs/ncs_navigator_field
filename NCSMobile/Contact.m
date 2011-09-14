//
//  Contact.m
//  NCSMobile
//
//  Created by John Dzak on 9/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Contact.h"
#import "Event.h"
#import "Person.h"

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

+ (NSArray*) contactsFromEvents:(Event*) firstEvent, ... {
    NSMutableArray *contacts = [[NSMutableArray alloc] init ];
    id eachObject;
    va_list argumentList;
    if (firstEvent)
    {            
        Contact *first = [[Contact alloc] initWithEvent:firstEvent];
        [contacts addObject: first];
        va_start(argumentList, firstEvent);
        while ((eachObject = va_arg(argumentList, Event*))) {
            Contact *c = [[Contact alloc] initWithEvent:eachObject];
            [contacts addObject:c];
        }
        va_end(argumentList);
    }
    return contacts;
}

- (void) addEvent: (Event*)event {
    if (_events == NULL) {
        self.events = [[NSMutableArray alloc] init];
    }
    [self.events addObject:event];
}

- (BOOL) isEventPartOfContact: (Event*)event {
    BOOL dates = [self.startDate isEqualToDate:event.date];
    BOOL persons = [self.person.id isEqualToString:event.person.id];
    return dates && persons;
}

- (void) dealloc {
    [_startDate release];
    [_person release];
    [_events release];
    [super dealloc];
}

@end
