//
//  DetailViewPresenterTest.m
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewPresenterTest.h"
#import "DetailViewPresenter.h"
#import "Event.h"

//@interface DetailViewPresenterTest ()
//@property (nonatomic, retain) UIPopoverController *popoverController;
//- (void)configureView;
//@end

@implementation DetailViewPresenterTest

DetailViewPresenter* dvp;
Event* e1;
Event* e2;
Event* e3;

- (void)setUp
{
    [super setUp];
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm"];
    [f setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];

    e1 = [[Event alloc] init];
    e1.name = @"Collect Soil";
    e1.date = [f dateFromString:@"2010-12-08 09:30"];
    
    e2 = [[Event alloc] init];
    e2.name = @"Blood Draw";
    e2.date = [f dateFromString:@"2010-12-08 09:30"];
    
    e3 = [[Event alloc] init];
    e3.name = @"Avoid Subject";
    e3.date = [f dateFromString:@"2010-12-09 09:30"];
    
    NSArray *events = [NSArray arrayWithObjects:e1, e2, e3, nil];
    dvp = [[DetailViewPresenter alloc] initWithEvents:events];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testGroupedEventTimes {
    NSArray* a = [dvp groupedEventDates];
    STAssertEquals([a count], 2U, @"Wrong number of event times");
    STAssertEquals([a objectAtIndex:0], e1.date, @"Dates should be equal");
    STAssertEquals([a objectAtIndex:1], e3.date, @"Dates should be equal");
}

- (void)testGetEventsByDate {
    NSArray* a = [dvp getEventsByDate:e1.date];
    STAssertEquals([a count], 2U, @"Wrong number of event times");
    STAssertEquals([[a objectAtIndex:0] name], @"Blood Draw", @"Wrong event");
    STAssertEquals([[a objectAtIndex:1] name], @"Collect Soil", @"Wrong event");
}

//- (void) testContactsOrderedByDate {
//    NSArray* a = [dvp contactsOrderedByDate];
//    STAssertEquals([a count], 2U, @"Wrong number of event times");
//    STAssertEquals([a objectAtIndex:0], e1.date, @"Dates should be equal");
//    STAssertEquals([a objectAtIndex:1], e3.date, @"Dates should be equal");
//}

@end

