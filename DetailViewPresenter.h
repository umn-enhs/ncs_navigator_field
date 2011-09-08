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

@interface DetailViewPresenter : NSObject {
    NSArray* _events;
}

- (DetailViewPresenter*)initWithEvents: (NSArray*)events;
- (NSInteger) numberOfSections;
- (NSInteger) numberOfRowsInSection: (NSInteger)section;
- (NSString*) sectionName: (NSInteger)section;
- (NSArray*) buildContactsFromEvents;
- (NSArray*) eventsSortedByDateAndPersonName;
- (Contact*) contactAtIndex: (NSInteger)index;


@property(nonatomic,retain) NSArray* events;

@end
