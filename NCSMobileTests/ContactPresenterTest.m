//
//  ContactPresenterTest.m
//  NCSMobile
//
//  Created by John Dzak on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactPresenterTest.h"
#import "ContactPresenter.h"
#import "Fixtures.h"
#import "Contact.h"
#import "Address.h"
#import "Event.h"

@implementation ContactPresenterTest

Contact *c;
Person *tom;
ContactPresenter *presenter;

- (void)setUp
{
    [super setUp];
    
    tom = [Fixtures createPersonWithId:@"T1" name:@"Tom"];
    
    
    c = [Fixtures createContactWithName:@"Collect Soil" 
                               startDate:[Fixtures createDateFromString:@"2010-12-08 09:30"]
                                  person: tom];

    Address *a = [Fixtures createAddressWithStreet:@"1 Sesame St" city: @"Chicago" state:@"IL" zip:60611];
    
    Event *e = [c.events objectAtIndex:0];
    e.dwelling = [Fixtures createDwellingWithId:@"D1" address:a];

    presenter = [[ContactPresenter alloc] initUsingContact:c];

}

- (void)testSections {
    STAssertEquals([presenter.sections count], 3U, @"Wrong number of sections");
}


@end
