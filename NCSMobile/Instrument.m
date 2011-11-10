//
//  Instrument.m
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Instrument.h"

@implementation Instrument

@synthesize surveyRef=_surveyRef;

- (void)dealloc {
    [_surveyRef release];
    [super dealloc];
}

@end
