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

@interface Contact : NSObject {
    Person *_person;
    NSDate *_startDate;
    NSMutableArray *_events;
}

- (Contact*) initWithEvent:(Event*)event;
- (void) addEvent: (Event*)event;
- (BOOL) isEventPartOfContact: (Event*)event;
+ (NSArray*) contactsFromEvents:(Event*) firstEvent, ...;
- (BOOL) canBeCoalescedWith:(Contact*)contact;


@property(nonatomic,retain) Person *person;
@property(nonatomic,retain) NSDate *startDate;
@property(nonatomic,retain) NSMutableArray *events;

@end
