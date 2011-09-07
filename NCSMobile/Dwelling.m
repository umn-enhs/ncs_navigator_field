//
//  Dwelling.m
//  NCSMobile
//
//  Created by John Dzak on 9/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Dwelling.h"

@implementation Dwelling

@synthesize id=_id;

- (void) dealloc {
    [_id release];
    [super dealloc];
}

@end
