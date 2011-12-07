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

+ (PickerOption*) po:(NSString*)text value:(NSInteger)value {
    return [[[PickerOption alloc] initWithText:text value:value] autorelease];
}
  
// TODO: Convert to use PickerOption class with plist file
+ (NSArray*) contactTypes {
    return [[NSArray alloc] initWithObjects:
             [self po:@"In-person" value:1],
             [self po:@"Mail" value:2],
             [self po:@"Telephone" value:3],
             [self po:@"Email" value:4],
             [self po:@"Text Message" value:5],
             [self po:@"Website" value:6],
             [self po:@"Other" value:-5],
             [self po:@"Missing in Error" value:-4], nil];
}

+ (NSArray*) whoContacted {
    return [[NSArray alloc] initWithObjects:
            [self po:@"NCS Participant" value:1],
            [self po:@"Mother of NCS Child" value:2],
            [self po:@"Father of NCS Child" value:3],
            [self po:@"Alternate Caregiver of NCS Child" value:4],
            [self po:@"Household member" value:5],
            [self po:@"Neighbor" value:6],
            [self po:@"Non-resident family member" value:7],
            [self po:@"Provider" value:8],
            [self po:@"Friend" value:9],
            [self po:@"No contact made with anyone" value:10],
            [self po:@"Other" value:-5],
            [self po:@"Missing in Error" value:-4], nil ];
}

+ (NSArray*) language {
    return [[NSArray alloc] initWithObjects:
            [self po:@"English" value:1],
            [self po:@"Spanish" value:2],
            [self po:@"Arabic" value:3],
            [self po:@"Chinese" value:4],
            [self po:@"French" value:5],
            [self po:@"French Creole" value:6],
            [self po:@"German" value:7],
            [self po:@"Italian" value:8],
            [self po:@"Korean" value:9],
            [self po:@"Polish" value:10],
            [self po:@"Russian" value:11],
            [self po:@"Tagalog" value:12],
            [self po:@"Vietnamese" value:13],
            [self po:@"Urdu" value:14],
            [self po:@"Punjabi" value:15],
            [self po:@"Bengali" value:16],
            [self po:@"Farsi" value:17],
            [self po:@"Refused" value:-1],
            [self po:@"Other" value:-5],
            [self po:@"Unknown" value:-6],
            [self po:@"Missing in Error" value:-4], nil ];
}

+ (NSArray*) interpreter {
    return [[NSArray alloc] initWithObjects:
            [self po:@"Bilingual interviewer" value:1],
            [self po:@"In-person professional interpreter" value:2],
            [self po:@"In person family member interpreter" value:3],
            [self po:@"Language-line interpreter" value:4],
            [self po:@"Video interpreter" value:5],
            [self po:@"Sign Language Interpreter" value:6],
            [self po:@"Other" value:-5],
            [self po:@"Legitimate Skip" value:-3],
            [self po:@"Missing in Error" value:-4], nil];
}

+ (NSArray*) location {
    return [[NSArray alloc] initWithObjects:
            [self po:@"Person/participant home" value:1],
            [self po:@"NCS Site office" value:2],
            [self po:@"Provider office" value:3],
            [self po:@"Hospital" value:4],
            [self po:@"Community event" value:5],
            [self po:@"School" value:6],
            [self po:@"Other" value:-5],
            [self po:@"Missing in Error" value:-4] , nil];
}

+ (NSArray*) private {
    return [[NSArray alloc] initWithObjects:
            [self po:@"Yes" value:1],
            [self po:@"No" value:2],
            [self po:@"Missing in Error" value:-4], nil];
}
@end
