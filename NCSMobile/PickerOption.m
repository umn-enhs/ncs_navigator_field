//
//  PickerOption.m
//  NCSMobile
//
//  Created by John Dzak on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PickerOption.h"

@implementation PickerOption

@synthesize text;

- (id) initWithText:(NSString*)t value:(NSInteger)v {
    if (self = [self init]) {
        self.text = t;
        _value = v;
    }
    return self;
}

- (NSInteger) value {
    return _value;
}

+ (PickerOption*) findWithValue:(NSInteger)value fromOptions:(NSArray*)options {
    for (PickerOption* o in options) {
        if (o.value == value) {
            return o;
        }
    }
    return NULL;
}
  
// TODO: Convert to use PickerOption class with plist file
+ (NSArray*) allContactTypes {
    return [[NSArray alloc] initWithObjects:
             [[PickerOption alloc] initWithText:@"In-person" value:1],
             [[PickerOption alloc] initWithText:@"Mail" value:2],
             [[PickerOption alloc] initWithText:@"Telephone" value:3],
             [[PickerOption alloc] initWithText:@"Email" value:4],
             [[PickerOption alloc] initWithText:@"Text Message" value:5],
             [[PickerOption alloc] initWithText:@"Website" value:6],
             [[PickerOption alloc] initWithText:@"Other" value:-5],
             [[PickerOption alloc] initWithText:@"Missing in Error" value:-4], nil];
}

@end
