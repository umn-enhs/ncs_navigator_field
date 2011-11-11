//
//  Contact.h
//  NCSMobile
//
//  Created by John Dzak on 9/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Event;
@class Person;
@class Location;

@interface Contact : NSManagedObject

@property(nonatomic,retain) NSNumber* type;
@property(nonatomic,retain) Person* person;
@property(nonatomic,retain) NSDate* startDate;
@property(nonatomic,retain) NSDate* endDate;
@property(nonatomic,retain) NSSet* events;
@property(nonatomic,retain) Location* location;

@end
