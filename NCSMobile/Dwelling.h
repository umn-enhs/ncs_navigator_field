//
//  Dwelling.h
//  NCSMobile
//
//  Created by John Dzak on 9/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Address;

@interface Dwelling : NSObject {
    NSString* _id;
    Address* _address;
}

@property(nonatomic,retain) NSString* id;
@property(nonatomic,retain) Address* address;
    
@end
