//
//  DetailViewPresenterTest.m
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactNavigationTableTest.h"
#import "ContactNavigationTable.h"
#import "Event.h"
#import "Person.h"
#import "Contact.h"

@implementation ContactNavigationTableTest

ContactNavigationTable* dvp;
Event *e1, *e2, *e3;

- (void)setUp
{
    [super setUp];
    NSDateFormatter *f = [[[NSDateFormatter alloc] init] autorelease];
    [f setDateFormat:@"yyyy'-'MM'-'dd' 'HH':'mm"];
    [f setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];

//    Person *fred = [[Person alloc] init];
//    fred.id = @"F1";
//    fred.name = @"Fred Flintstone";
//    
//    e1 = [[[Event alloc] init] autorelease];
//    e1.name = @"Collect Soil";
//    e1.date = [f dateFromString:@"2010-12-08 00:00"];
//    e1.person = fred;
//    
//    e2 = [[[Event alloc] init] autorelease];
//    e2.name = @"Blood Draw";
//    e2.date = [f dateFromString:@"2010-12-08 00:00"];
//    e2.person = fred;
//    
//    e3 = [[[Event alloc] init] autorelease];
//    e3.name = @"Avoid Subject";
//    e3.date = [f dateFromString:@"2010-12-09 00:00"];
//    e3.person = fred;
//    
    Contact* c1 = [Contact new];
    c1.startDate = [f dateFromString:@"2010-12-08 00:00"];
    
    Contact* c2 = [Contact new];
    c1.startDate = [f dateFromString:@"2010-12-08 00:00"];
    
    Contact* c3 = [Contact new];
    c1.startDate = [f dateFromString:@"2010-12-08 00:00"];
    
    NSArray *contacts = [NSArray arrayWithObjects:c1, c2, c3, nil];
    dvp = [[[ContactNavigationTable alloc] initWithContacts:contacts] autorelease];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testSections {
    NSArray* sections = dvp.sections;
    STAssertEquals([sections count], 2U, @"Wrong number of sections");
    // TODO: Test section name
}

@end

