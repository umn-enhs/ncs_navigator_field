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

#pragma mark properties

@property(nonatomic,retain) NSNumber* typeId;

@property(nonatomic,retain) Person* person;

@property(nonatomic,retain) NSDate* startDate;

@property(nonatomic,retain) NSDate* endDate;

@property(nonatomic) BOOL initiated;

@property(nonatomic,retain) NSNumber* whoContactedId;

@property(nonatomic,retain) NSString* whoContactedOther;

@property(nonatomic,retain) NSString* comments;

@property(nonatomic,retain) NSNumber* languageId;

@property(nonatomic,retain) NSString* languageOther;

@property(nonatomic,retain) NSNumber* interpreterId;

@property(nonatomic,retain) NSString* interpreterOther;

@property(nonatomic,retain) NSNumber* privateId;

@property(nonatomic,retain) NSString* privateDetail;

@property(nonatomic,retain) NSNumber* distanceId;

@property(nonatomic,retain) NSNumber* dispositionId;


#pragma mark relations

@property(nonatomic,retain) NSSet* events;

@property(nonatomic,retain) Location* location;


#pragma mark methods

- (BOOL) closed;

@end
