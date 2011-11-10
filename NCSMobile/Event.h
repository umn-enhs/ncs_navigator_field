//
//  Event.h
//  NCSMobile
//
//  Created by John Dzak on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dwelling;
@class Person;

@interface Event : NSObject {
    NSString* _name;
    NSArray* _instruments;
}

@property(nonatomic,copy) NSString* name;
@property(nonatomic,retain) NSArray* instruments;

@end
