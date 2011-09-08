//
//  DetailViewPresenter.h
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DetailViewPresenter : NSObject {
    NSArray* _events;
}

- (DetailViewPresenter*)initWithEvents: (NSArray*)events;
- (NSArray*) groupedEventDates;
- (NSArray*) getEventsByDate: (NSDate*) date;
- (NSInteger) numberOfSections;
- (NSInteger) numberOfRowsInSection: (NSInteger)section;
- (NSString*) sectionName: (NSInteger)section;

@property(nonatomic,retain) NSArray* events;

@end
