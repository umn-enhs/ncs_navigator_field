//
//  Event.h
//  NCSMobile
//
//  Created by John Dzak on 9/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject {
    NSString* _name;
    NSDate* _date;
}
@property(nonatomic,retain) NSString* name;
@property(nonatomic,retain) NSDate* date;
@end
