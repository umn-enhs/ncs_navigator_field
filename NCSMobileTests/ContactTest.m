//
//  ContactTest.m
//  NCSMobile
//
//  Created by John Dzak on 9/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactTest.h"
#import "Fixtures.h"
#import "Contact.h"
#import "Event.h"
#import "Person.h"

@implementation ContactTest

Event *e1, *e2;
Person *tom, *jen;

- (void)setUp
{
    [super setUp];
    
    e1 = [Fixtures createEventWithName:@"Collect Soil" 
                   date:[Fixtures createDateFromString:@"2010-12-08 09:30"]];

    e2 = [Fixtures createEventWithName:@"Something else" 
                   date:[Fixtures createDateFromString:@"2010-12-08 10:30"]];
    
    tom = [Fixtures createPersonWithId:@"T1" name:@"Tom"];
    jen = [Fixtures createPersonWithId:@"J9" name:@"Jen"];
}

- (void)testInitWithEvent {
    e1.person = tom;
    
    Contact *c = [[[Contact alloc] initWithEvent:e1] autorelease];

    STAssertEquals(c.startDate, e1.date, @"Wrong date");
    STAssertEquals(c.person.name, tom.name, @"Wrong person");
    STAssertEquals([c.events count], 1U, @"Wrong number events");
}

- (void)testInit {
    Contact *c = [[[Contact alloc] init] autorelease];
    STAssertEquals([c.events count], 0U, @"Wrong number events");
}

- (void)testAddEvent {
    Contact *c = [[[Contact alloc] init] autorelease];
    [c addEvent:e1];
    
    STAssertEquals([c.events count], 1U, @"Wrong number events");
}

- (void)testIsEventPartOfContact {
    e1.person = tom;
    e2.person = jen;
    
    Contact *c = [[[Contact alloc] initWithEvent:e1] autorelease];
        
    STAssertFalse([c isEventPartOfContact:e2], @"Event should not be part of this contact");
}

- (void)testContactsFromEvents {
    NSArray *contacts = [Contact contactsFromEvents: e1, e2, nil];
    
    STAssertEquals([contacts count], 2U, @"Wrong number of contacts");
    STAssertEquals(e1.date, [[contacts objectAtIndex:0] startDate], @"Wrong start date");
    STAssertEquals(e2.date, [[contacts objectAtIndex:1] startDate], @"Wrong start date");    
}

- (void) testContactCanBeCoalesced {
    e1.person = tom;
    e2.person = tom;
    e1.date = [Fixtures createDateFromString:@"2010-12-08 09:30"];
    e2.date = [Fixtures createDateFromString:@"2010-12-08 09:30"];
    
    Contact *c1 = [[[Contact alloc] initWithEvent:e1] autorelease];
    Contact *c2 = [[[Contact alloc] initWithEvent:e2] autorelease];
    STAssertTrue([c1 canBeCoalescedWith:c2], @"Should be able to be coalesced");
    
}

- (void) testContactCanBeCoalescedDifferentDate {
    e1.person = tom;
    e2.person = tom;
    e1.date = [Fixtures createDateFromString:@"2010-12-08 09:30"];
    e2.date = [Fixtures createDateFromString:@"2010-12-08 10:30"];
    
    Contact *c1 = [[[Contact alloc] initWithEvent:e1] autorelease];
    Contact *c2 = [[[Contact alloc] initWithEvent:e2] autorelease];
    STAssertFalse([c1 canBeCoalescedWith:c2], @"Should not be able to be coalesced");
}

- (void) testContactCanBeCoalescedDifferentPerson {
    e1.person = tom;
    e2.person = jen;
    e1.date = [Fixtures createDateFromString:@"2010-12-08 09:30"];
    e2.date = [Fixtures createDateFromString:@"2010-12-08 09:30"];
    
    Contact *c1 = [[[Contact alloc] initWithEvent:e1] autorelease];
    Contact *c2 = [[[Contact alloc] initWithEvent:e2] autorelease];
    STAssertFalse([c1 canBeCoalescedWith:c2], @"Should not be able to be coalesced");
}

@end
