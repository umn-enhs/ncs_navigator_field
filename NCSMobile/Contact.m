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
    NSMutableArray *events = [[[NSMutableArray alloc] init ] autorelease];
    id eachObject;
    va_list argumentList;
    if (firstEvent)
    {            
        [events addObject: firstEvent];
        va_start(argumentList, firstEvent);
        while ((eachObject = va_arg(argumentList, Event*))) {
            [events addObject:eachObject];
        }
        va_end(argumentList);
    }
    
    return [Contact contactsFromEventsArray:events];
}

+ (NSArray*) contactsFromEventsArray:(NSArray*) events {
    NSMutableArray *contacts = [[[NSMutableArray alloc] init] autorelease];
    for (Event* e in events) {
        [contacts addObject:[[Contact alloc] initWithEvent:e]];
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

- (BOOL) canBeCoalescedWith:(Contact*)contact {
    BOOL datesEqual = [self.startDate isEqualToDate:contact.startDate];
    BOOL personsEqual = [self.person.id isEqualToString:contact.person.id];
    return datesEqual && personsEqual;
}

- (void) coalesce:(Contact*)contact {
    if ([self canBeCoalescedWith:contact]) {
        for (Event *e in contact.events) {
            [self addEvent:e];
        }
    }
}

- (NSArray*) coalescableContacts:(NSArray*)contacts {
    NSMutableArray *coalescable = [[NSMutableArray new] autorelease];
    for (Contact *c in contacts) {
        if ([self canBeCoalescedWith:c]) {
            [coalescable addObject:c];
        }
    }
    return coalescable;
}

- (void) dealloc {
    [_startDate release];
    [_person release];
    [_events release];
    [super dealloc];
}

@end
