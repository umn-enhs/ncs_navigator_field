//
//  Event.h
//  NCSMobile
//
//  Created by John Dzak on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dwelling;
@class Person;

@interface Event : NSObject {
    NSString* _id;
    NSString* _name;
    NSDate* _date;
    Person* _person;
    Dwelling* _dwelling;
    NSArray* _instruments;
}

@property(nonatomic,retain) NSString* id;
@property(nonatomic,retain) NSString* name;
@property(nonatomic,retain) NSDate* date;
@property(nonatomic,retain) Person* person;
@property(nonatomic,retain) Dwelling* dwelling;
@property(nonatomic,retain) NSArray* instruments;

@end
