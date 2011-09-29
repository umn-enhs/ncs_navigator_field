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
@synthesize email=_email;
@synthesize homePhone=_homePhone;
@synthesize cellPhone=_cellPhone;
@synthesize dwelling=_dwelling;

-(id) copyWithZone: (NSZone *) zone {
    Person *copy = [[Person allocWithZone:zone] init];
    copy.id = self.id;
    copy.name = self.name;
    copy.dwelling = self.dwelling;
    copy.homePhone = self.homePhone;
    copy.cellPhone = self.cellPhone;
    copy.email = self.email;
    return copy;
}

- (void)dealloc {
    [_id release];
    [_name release];
    [_homePhone release];
    [_cellPhone release];
    [_email release];
    [_dwelling release];
    [super dealloc];
}
@end
