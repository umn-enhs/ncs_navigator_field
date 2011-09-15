//
//  Row.m
//  NCSMobile
//
//  Created by John Dzak on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Row.h"

@implementation Row

@synthesize text=_text;
@synthesize subText=_subText;

- (void) dealloc {
    [_text release];
    [_subText release];
    [super dealloc];
}
@end
