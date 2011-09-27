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

@property(nonatomic,copy) NSString* id;
@property(nonatomic,copy) NSString* name;
@property(nonatomic,copy) NSString* email;
@property(nonatomic,copy) NSString* cellPhone;
@property(nonatomic,copy) NSString* homePhone;
@property(nonatomic,retain) Dwelling* dwelling;

@end
