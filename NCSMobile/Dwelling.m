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
    [super dealloc];
}

@end
