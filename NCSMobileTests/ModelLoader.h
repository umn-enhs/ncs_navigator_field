//
//  ModelLoader.h
//  NCSMobile
//
//  Created by John Dzak on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelLoader : NSObject {
    NSManagedObjectContext* context;
    NSManagedObjectModel* model;
}

-(id) initWithName: (NSString*) modelName;
-(NSManagedObjectContext*) context;
@end
