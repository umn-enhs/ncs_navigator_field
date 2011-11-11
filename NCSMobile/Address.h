//
//  Address.h
//  NCSMobile
//
//  Created by John Dzak on 9/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Address : NSManagedObject 
@property(nonatomic,retain) NSString* street;
@property(nonatomic,retain) NSString* city;
@property(nonatomic,retain) NSNumber* zipCode; 
@property(nonatomic,retain) NSString* state;

@end
