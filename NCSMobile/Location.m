//
//  Location.m
//  NCSMobile
//
//  Created by John Dzak on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Location.h"
#import "Address.h"

@implementation Location

@synthesize code=_code;
@synthesize other=_other;
@synthesize details=_details;
@synthesize address=_address;

- (void) dealloc {
    [_address release];
    [super dealloc];
}
@end
