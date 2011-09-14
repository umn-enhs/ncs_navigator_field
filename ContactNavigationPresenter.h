//
//  DetailViewPresenter.h
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Event;
@class Contact;

@interface ContactNavigationPresenter : NSObject {
    NSArray* _events;
}

- (ContactNavigationPresenter*)initWithEvents: (NSArray*)events;
- (NSInteger) numberOfSections;
- (NSInteger) numberOfRowsInSection: (NSInteger)section;
- (NSString*) sectionName: (NSInteger)section;
- (NSArray*) buildContactsFromEvents;
- (NSArray*) sortEventsByDateAndPersonName:(NSArray*)events;
- (Contact*) contactInSection:(NSInteger)section index: (NSInteger)index;
- (NSArray*) contactDates;
- (NSArray*) contactsWithDate:(NSDate*)date;


@property(nonatomic,retain) NSArray* events;

@end
