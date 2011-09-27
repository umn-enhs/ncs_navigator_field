//
//  Section.m
//  NCSMobile
//
//  Created by John Dzak on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Section.h"

@implementation Section

@synthesize rows=_rows;
@synthesize name=_name;

- (Section*)initWithRows:(id)row,... {
    if (self = [super init]) {
        id eachObject;
        va_list argumentList;
        if (row) // The first argument isn't part of the varargs list,
        {                                   // so we'll handle it separately.
            [self addRow:row];
            va_start(argumentList, row); // Start scanning for arguments after firstObject.
            eachObject = va_arg(argumentList, id);
            while (eachObject) { // As many times as we can get an argument of type "id"
                [self addRow: eachObject]; // that isn't nil, add it to self's contents.
                eachObject = va_arg(argumentList, id);
            }
            va_end(argumentList);
        }
    }
    return self;
}

- (void)addRow:(Row*)row{
    NSMutableArray *rows = [NSMutableArray arrayWithArray:self.rows];
    [rows addObject:row];
    self.rows = rows;
}

- (void) dealloc {
    [_rows release];
    [_name release];
    [super dealloc];
}

@end
