//
//  Event.h
//  NCSMobile
//
//  Created by John Dzak on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dwelling;

@interface Event : NSObject {
    NSString* _id;
    NSString* _name;
    NSDate* _date;
    Dwelling* _dwelling;
}

@property(nonatomic,retain) NSString* id;
@property(nonatomic,retain) NSString* name;
@property(nonatomic,retain) NSDate* date;
@property(nonatomic,retain) Dwelling* dwelling;

@end
