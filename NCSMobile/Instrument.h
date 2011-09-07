//
//  Instrument.h
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Instrument : NSObject {
    NSString* _id;
    NSNumber* _version;
    NSString* _name;
}

@property(nonatomic,retain) NSString* id;
@property(nonatomic,retain) NSNumber* version;
@property(nonatomic,retain) NSString* name;

@end
