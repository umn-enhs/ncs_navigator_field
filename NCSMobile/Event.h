//
//  Event.h
//  NCSMobile
//
//  Created by John Dzak on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Contact;

@interface Event : NSManagedObject

/* properties */

@property(nonatomic,retain) NSString* name;

@property(nonatomic,retain) NSNumber* eventTypeId;

@property(nonatomic,retain) NSString* eventTypeOther;

@property(nonatomic,retain) NSString* repeatKey;

@property(nonatomic,retain) NSDate* startDate;

@property(nonatomic,retain) NSDate* endDate;

@property(nonatomic,retain) NSNumber* incentiveTypeId;

@property(nonatomic,retain) NSString* incentiveCash;

@property(nonatomic,retain) NSString* incentiveNonCash;

@property(nonatomic,retain) NSNumber* dispositionId;

@property(nonatomic,retain) NSNumber* dispositionCategoryId;

@property(nonatomic,retain) NSNumber* breakOffId;

@property(nonatomic,retain) NSString* comments;


/* relationships */

@property(nonatomic,retain) Contact* contact;

@property(nonatomic,retain) NSSet* instruments;

@end
