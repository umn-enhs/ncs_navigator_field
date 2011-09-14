//
//  DetailViewPresenterTest.m
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactNavigationPresenterTest.h"
#import "ContactNavigationPresenter.h"
#import "Event.h"
#import "Person.h"
#import "Contact.h"

//@interface DetailViewPresenterTest ()
//@property (nonatomic, retain) UIPopoverController *popoverController;
//- (void)configureView;
//@end

@implementation ContactNavigationPresenterTest

ContactNavigationPresenter* dvp;
Event* e1;
Event* e2;
Event* e3;

- (void)setUp
{
    [super setUp];
    NSDateFormatter *f = [[[NSDateFormatter alloc] init] autorelease];
    [f setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm"];
    [f setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];

    Person *fred = [[Person alloc] init];
    fred.id = @"F1";
    fred.name = @"Fred Flintstone";
    
    e1 = [[[Event alloc] init] autorelease];
    e1.name = @"Collect Soil";
    e1.date = [f dateFromString:@"2010-12-08 09:30"];
    e1.person = fred;
    
    e2 = [[[Event alloc] init] autorelease];
    e2.name = @"Blood Draw";
    e2.date = [f dateFromString:@"2010-12-08 09:30"];
    e2.person = fred;
    
    e3 = [[[Event alloc] init] autorelease];
    e3.name = @"Avoid Subject";
    e3.date = [f dateFromString:@"2010-12-09 09:30"];
    e3.person = fred;
    
    NSArray *events = [NSArray arrayWithObjects:e1, e2, e3, nil];
    dvp = [[[ContactNavigationPresenter alloc] initWithEvents:events] autorelease];
}

- (void)tearDown
{
    // Tear-down code here.
    
    
    [super tearDown];
}
//
//- (void)testGroupedEventTimes {
//    NSArray* a = [dvp groupedEventDates];
//    STAssertEquals([a count], 2U, @"Wrong number of event times");
//    STAssertEquals([a objectAtIndex:0], e1.date, @"Dates should be equal");
//    STAssertEquals([a objectAtIndex:1], e3.date, @"Dates should be equal");
//}
//
//- (void)testGetEventsByDate {
//    NSArray* a = [dvp getEventsByDate:e1.date];
//    STAssertEquals([a count], 2U, @"Wrong number of event times");
//    STAssertEquals([[a objectAtIndex:0] name], @"Blood Draw", @"Wrong event");
//    STAssertEquals([[a objectAtIndex:1] name], @"Collect Soil", @"Wrong event");
//}

- (void)testContactAtIndex {
    Contact* a = [dvp contactInSection:0 index:0];
    STAssertEquals([a.events count], 2U, @"Wrong number of events");
    STAssertTrue([a.events containsObject:e1], @"Should contain 'Collect Soil' event");
    STAssertTrue([a.events containsObject:e2], @"Should contain 'Blood Draw' event");
}
//
//- (void)testNumberOfSections {
//    - (NSInteger) numberOfSections;
//}
//
//- (void)testNumberOfRowsInSection {
//    - (NSInteger) numberOfRowsInSection: (NSInteger)section;
//}
//
//- (void)testSectionName {
//    - (NSString*) sectionName: (NSInteger)section;    
//    
//}

//- (void) testContactsOrderedByDate {
//    NSArray* a = [dvp contactsOrderedByDate];
//    STAssertEquals([a count], 2U, @"Wrong number of event times");
//    STAssertEquals([a objectAtIndex:0], e1.date, @"Dates should be equal");
//    STAssertEquals([a objectAtIndex:1], e3.date, @"Dates should be equal");
//}

@end

