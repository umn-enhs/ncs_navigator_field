//
//  ContactTest.m
//  NCSMobile
//
//  Created by John Dzak on 9/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactTest.h"
#import "Contact.h"
#import "Event.h"
#import "Person.h"

@implementation ContactTest

NSDateFormatter *f;
Event *e;

- (void)setUp
{
    [super setUp];
    f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm"];
    [f setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    
    e = [[Event alloc] init];
    e.name = @"Collect Soil";
    e.date = [f dateFromString:@"2010-12-08 09:30"];
    e.person = [[Person alloc] init];
    e.person.name = @"Frank";
    e.person.id = @"F7";
}

- (void)testInitWithEvent {
    Contact *c = [[Contact alloc] initWithEvent:e];
    STAssertEquals(c.startDate, e.date, @"Wrong date");
    STAssertEquals(c.person.name, @"Frank", @"Wrong person");
    STAssertEquals([c.events count], 1U, @"Wrong number events");
}

- (void)testAddEvent {
    Contact *c = [[Contact alloc] init];
    STAssertEquals([c.events count], 0U, @"Wrong number events");
    [c addEvent:e];
    STAssertEquals([c.events count], 1U, @"Wrong number events");
}

- (void)testIsEventPartOfContact {
    Contact *c = [[Contact alloc] initWithEvent:e];
    
    Event *diff = [[Event alloc] init];
    diff.name = @"Collect Soil";
    diff.date = [f dateFromString:@"2010-12-08 09:30"];
    diff.person = [[Person alloc] init];
    diff.person.id = @"K9";
    
    STAssertFalse([c isEventPartOfContact:diff], @"Event should not be part of this contact");
}

@end
