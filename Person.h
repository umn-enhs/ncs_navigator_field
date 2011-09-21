//
//  Person.h
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dwelling;

@interface Person : NSObject<NSCopying> {
    NSString* _id;
    NSString* _name;
    NSString* _email;
    NSString* _cellPhone;
    NSString* _homePhone;
    Dwelling* _dwelling;
}

-(id) copyWithZone: (NSZone *) zone;

@property(nonatomic,retain) NSString* id;
@property(nonatomic,retain) NSString* name;
@property(nonatomic,retain) NSString* email;
@property(nonatomic,retain) NSString* cellPhone;
@property(nonatomic,retain) NSString* homePhone;
@property(nonatomic,retain) Dwelling* dwelling;

@end
