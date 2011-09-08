//
//  DetailViewPresenter.h
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Event;

@interface DetailViewPresenter : NSObject {
    NSArray* _events;
}

- (DetailViewPresenter*)initWithEvents: (NSArray*)events;
- (Event*) eventAtIndex: (NSInteger)index;
- (NSArray*) groupedEventDates;
- (NSArray*) getEventsByDate: (NSDate*) date;
- (NSArray*) eventsSortedByName: (NSArray*)events;
- (NSInteger) numberOfSections;
- (NSInteger) numberOfRowsInSection: (NSInteger)section;
- (NSString*) sectionName: (NSInteger)section;

@property(nonatomic,retain) NSArray* events;

@end
