//
//  ModelLoader.m
//  NCSMobile
//
//  Created by John Dzak on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ModelLoader.h"

@implementation ModelLoader

-(id) init
{
    return [self initWithName: @"MyDocument"];
}

-(id) initWithName: (NSString*) modelName
{
    self = [super init];
    if (self != nil)
    {
        NSBundle* theBundle = [NSBundle mainBundle];
        NSURL* modelURL = [theBundle URLForResource: modelName 
                                      withExtension: @"momd"];
        if (modelURL == nil)
        {
            // log error 
        }
        else 
        {
            model = [[NSManagedObjectModel alloc] initWithContentsOfURL: modelURL];
            if (model == nil)
            { 
                // log error 
            }
        }
    }
    return self;
}

// Create or return the context

-(NSManagedObjectContext*) context
{
    if (context == nil)
    {
        context = [[NSManagedObjectContext alloc] init];
        NSPersistentStoreCoordinator* coordinator
        = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel: model];
        [context setPersistentStoreCoordinator: coordinator];
        NSError* error = nil;
        NSPersistentStore* newStore
        = [coordinator addPersistentStoreWithType: NSInMemoryStoreType 
                                    configuration: nil 
                                              URL: nil 
                                          options: nil 
                                            error: &error];
        if (newStore == nil)
        {
            NSLog(@"Failed to create store, reason %@", error);
            context = nil;
        }
    }
    return context;
}

@end
