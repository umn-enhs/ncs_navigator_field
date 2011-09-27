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
    NSString *_rowClass;
}

@property(nonatomic,retain) id entity;
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *detailText;
@property(nonatomic,copy) NSString *rowClass;

- (id) initWithText:(NSString*)text;
- (id) initWithText:(NSString*)text detailText:(NSString*)dt;
@end
