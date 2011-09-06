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
@synthesize dwelling=_dwelling;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void) dealloc {
    [_id release];
    [_name release];
    [_date release];
    [_dwelling release];
    [super dealloc];
}

@end
