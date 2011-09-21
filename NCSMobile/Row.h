//
//  Row.h
//  NCSMobile
//
//  Created by John Dzak on 9/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Row : NSObject {
    id entity;
    NSString *_text;
    NSString *_detailText;
}

@property(nonatomic,retain) id entity;
@property(nonatomic,retain) NSString *text;
@property(nonatomic,retain) NSString *detailText;

- (id) initWithText:(NSString*)text;
- (id) initWithText:(NSString*)text detailText:(NSString*)dt;
@end
