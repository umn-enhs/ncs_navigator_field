//
//  ContactDetailTable.h
//  NCSMobile
//
//  Created by John Dzak on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISimpleTable.h"

@class Contact;
@class Section;

@interface ContactDetailTable : NSObject<ISimpleTable> {
    NSArray* _sections;
    Contact* _contact;
}

@property(nonatomic,retain) NSArray* sections;

- (id)initUsingContact:(Contact*)contact;
- (NSArray*) buildSectionsFromContact:(Contact*)contact;
- (Section*) contactSection;
- (Section*) participantSection;
@end
