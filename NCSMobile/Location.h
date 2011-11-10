//
//  Location.h
//  NCSMobile
//
//  Created by John Dzak on 11/9/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Address;

@interface Location : NSObject {
    NSNumber* _code;
    NSString* _other;
    NSString* _details;
    Address* _address;
}

@property(nonatomic,retain) NSNumber* code;

@property(nonatomic,retain) NSString* other;

@property(nonatomic,retain) NSString* details;

@property(nonatomic,retain) Address* address;

@end
