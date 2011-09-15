//
//  Section.h
//  NCSMobile
//
//  Created by John Dzak on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section : NSObject {
    NSArray *_rows;
    NSString *_name;
}

@property(nonatomic,retain) NSArray *rows;
@property(nonatomic,retain) NSString *name;

@end
