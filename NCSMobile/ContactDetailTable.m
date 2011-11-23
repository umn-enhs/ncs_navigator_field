//
//  ContactDetailTable.m
//  NCSMobile
//
//  Created by John Dzak on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactDetailTable.h"

#import "Row.h"
#import "Section.h"

@implementation ContactDetailTable

@synthesize sections=_sections;

- (id)initUsingContact:(Contact*)contact {
    self = [super init];
    if (self) {
        _contact = contact;
        self.sections = [self buildSectionsFromContact:contact];
    }
    
    return self;
}

- (NSArray*) buildSectionsFromContact:(Contact*)contact { 
    return [NSArray arrayWithObjects: 
            [self contactSection],
            [self participantSection],
            nil];
}

- (Section*) contactSection {
    Row *home = [[Row alloc] initWithText:@"Contact Type"];
    
    home.detailText = @"Type";
    home.editable = YES;
    
    return [[[Section alloc] initWithRows:home, nil] autorelease];
}

- (Section*) participantSection {
    Row *name = [[Row alloc] initWithText:@"Participant Name"];
    
    name.detailText = @"Name";
    name.editable = YES;
    
    return [[[Section alloc] initWithRows:name, nil] autorelease];    
}

@end
