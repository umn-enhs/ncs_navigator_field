//
//  Address.h
//  NCSMobile
//
//  Created by John Dzak on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSObject {
    NSString* _street;
    NSString* _city;
    NSNumber* _zipcode;
    NSString* _state;
}

@property(nonatomic,copy) NSString* street;
@property(nonatomic,copy) NSString* city;
@property(nonatomic,copy) NSNumber* zipcode; 
@property(nonatomic,copy) NSString* state;

@end
