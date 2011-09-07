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
    e1.date = [f dateFromString:@"2010-12-08 09:30"];
    
    e2 = [[Event alloc] init];
    e2.date = [f dateFromString:@"2010-12-08 09:30"];
    
    e3 = [[Event alloc] init];
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
    NSArray* keys = [dvp groupedEventTimes];
    STAssertEquals([keys count], 2U, @"Wrong number of event times");
    STAssertTrue([keys containsObject:e1.date], @"Should include date");
    STAssertTrue([keys containsObject:e3.date], @"Should include date");
}

- (void)testGetEventsByTime {
//    NSArray* actual = [dvp eventsByTime];

}

@end

