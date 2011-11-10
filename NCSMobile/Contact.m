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

@synthesize type=_type;
@synthesize startDate=_startDate;
@synthesize endDate=_endDate;
@synthesize person=_person;
@synthesize location=_location;
@synthesize events=_events;


- (void) dealloc {
    [_type release];
    [_startDate release];
    [_endDate release];
    [_person release];
    [_location release];
    [_events release];
    [super dealloc];
}

@end
