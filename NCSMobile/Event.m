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

@synthesize name=_name;
@synthesize instruments=_instruments;

- (void) dealloc {
    [_name release];
    [_instruments release];
    [super dealloc];
}

@end
