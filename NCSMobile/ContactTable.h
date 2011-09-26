//
//  ContactPresenter.h
//  NCSMobile
//
//  Created by John Dzak on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISimpleTable.h"

@class Contact;
@class Section;

@interface ContactTable : NSObject<ISimpleTable> {
    Contact *_contact;
    NSArray *_sections;
}

@property(nonatomic,retain) Contact *contact;
@property(nonatomic,retain) NSArray *sections;

- (id)initUsingContact:(Contact*)contact;
- (NSArray*) buildSectionsFromContact:(Contact*)contact;
- (Section*) addresses;
- (Section*) phones;
- (Section*) emails;
- (Section*) instruments;

@end
