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

@interface Contact : NSObject {
    NSNumber* type;
    Person* _person;
    NSDate* _startDate;
    NSDate* _endDate;
    Location* _location;
    NSMutableArray* _events;
}



@property(nonatomic,retain) NSNumber* type;
@property(nonatomic,retain) Person* person;
@property(nonatomic,retain) NSDate* startDate;
@property(nonatomic,retain) NSDate* endDate;
@property(nonatomic,retain) NSMutableArray* events;
@property(nonatomic,retain) Location* location;

@end
