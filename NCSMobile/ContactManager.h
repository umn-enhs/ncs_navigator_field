//
//  ContactManager.h
//  NCSMobile
//
//  Created by John Dzak on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Contact;

@interface ContactManager : NSObject

+ (NSArray*) coalesce:(NSArray*)contacts;

@end
