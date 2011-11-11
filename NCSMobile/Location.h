//
//  Location.h
//  NCSMobile
//
//  Created by John Dzak on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Address;

@interface Location : NSManagedObject

@property(nonatomic,retain) NSNumber* code;

@property(nonatomic,retain) NSString* other;

@property(nonatomic,retain) NSString* details;

@property(nonatomic,retain) Address* address;

@end
