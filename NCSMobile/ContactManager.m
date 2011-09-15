//
//  ContactManager.m
//  NCSMobile
//
//  Created by John Dzak on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactManager.h"
#import "Contact.h"

@implementation ContactManager

+ (NSArray*) coalesce:(NSArray*)contacts {
    NSMutableArray *copied = [NSMutableArray arrayWithArray:contacts];
    NSMutableArray *result = [[[NSMutableArray alloc] init] autorelease];

    while ([copied count] > 0) {
        Contact *initial = [copied objectAtIndex:0];
        [result addObject:initial];
        [copied removeObjectAtIndex:0];

        NSArray *coalescable = [initial coalescableContacts:copied];
        [copied removeObjectsInArray:coalescable];
        for (Contact *c in coalescable) {
            [initial coalesce:c];
        }
    }

    return result; 
}



@end
