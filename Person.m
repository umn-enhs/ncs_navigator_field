//
//  Person.m
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"

@implementation Person

@synthesize id=_id;
@synthesize name=_name;

-(id) copyWithZone: (NSZone *) zone {
    Person *copy = [[Person allocWithZone:zone] init];
    copy.id = self.id;
    copy.name = self.name;
    return copy;
}

- (void)dealloc {
    [_id release];
    [_name release];
    [super dealloc];
}
@end
