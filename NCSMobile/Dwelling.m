//
//  Dwelling.m
//  NCSMobile
//
//  Created by John Dzak on 9/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Dwelling.h"
#import "Address.h"

@implementation Dwelling

@synthesize id=_id;
@synthesize address=_address;


- (void) dealloc {
    [_id release];
    [_address release];
    [super dealloc];
}

@end
