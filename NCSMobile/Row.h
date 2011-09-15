//
//  Row.h
//  NCSMobile
//
//  Created by John Dzak on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Row : NSObject {
    NSString *_text;
    NSString *_subText;
}

@property(nonatomic,retain) NSString *text;
@property(nonatomic,retain) NSString *subText;

@end
