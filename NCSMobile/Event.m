//
//  Event.m
//  NCSMobile
//
//  Created by John Dzak on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Event.h"
#import "Dwelling.h"

@implementation Event
@synthesize id=_id;
@synthesize name=_name;
@synthesize date=_date;
@synthesize person=_person;
@synthesize dwelling=_dwelling;
@synthesize instruments=_instruments;

- (void) dealloc {
    [_id release];
    [_name release];
    [_date release];
    [_person release];
    [_dwelling release];
    [_instruments release];
    [super dealloc];
}

@end
