//
//  PickerOptionTest.m
//  NCSMobile
//
//  Created by John Dzak on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PickerOptionTest.h"
#import "PickerOption.h"

@implementation PickerOptionTest

// All code under test must be linked into the Unit Test bundle
- (void)test_shouldBeInitializedProperly
{
    PickerOption* o = [[PickerOption alloc] initWithText:@"Red" value:1];
    STAssertEquals(true, false, @"HUH");
}

@end
