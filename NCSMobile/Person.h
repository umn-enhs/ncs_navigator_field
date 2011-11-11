//
//  Person.h
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dwelling;

@interface Person : NSManagedObject

@property(nonatomic,copy) NSString* name;
@property(nonatomic,copy) NSString* email;
@property(nonatomic,copy) NSString* cellPhone;
@property(nonatomic,copy) NSString* homePhone;

@end
