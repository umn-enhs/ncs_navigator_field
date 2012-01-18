//
//  Configuration.m
//  NCSMobile
//
//  Created by John Dzak on 1/16/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import "Configuration.h"

@implementation Configuration

@synthesize coreURL;

static Configuration* instance;


- (id)init {
    self = [super init];
    if (self) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"NCSNavigatorField" ofType:@"plist"];
        
        if (!path) {
            NSLog(@"NUCas.plist not found at %@/NCSNavigatorField.plist", [NSBundle mainBundle]);
        }
        
        NSDictionary* settings = [[NSDictionary alloc] initWithContentsOfFile:path];
        
        self.coreURL = [settings objectForKey:@"ncs.core.url"];
    }
    
    return self;
}

+ (Configuration*) instance {
    if (!instance) {
        instance = [[Configuration alloc] init];
    }
    return instance;
}

@end
