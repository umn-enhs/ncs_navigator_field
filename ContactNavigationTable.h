//
//  DetailViewPresenter.h
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISimpleTable.h"

@class Row;
@class Event;
@class Contact;

@interface ContactNavigationTable : NSObject<ISimpleTable> {
    NSArray* _events;
    NSArray* _contacts;
    NSArray* _sections;
}

- (ContactNavigationTable*)initWithEvents: (NSArray*)events;
- (NSArray*) buildSectionsUsingContacts:(NSArray*) contacts;
- (NSString*) buildSectionNameUsingDate:(NSDate*)date;
- (NSArray*) buildRowsUsingContacts:(NSArray*)contacts;

@property(nonatomic,retain) NSArray* events;
@property(nonatomic,retain) NSArray* contacts;
@property(nonatomic,retain) NSArray* sections;


@end
