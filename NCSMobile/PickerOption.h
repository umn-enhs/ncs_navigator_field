//
//  PickerOption.h
//  NCSMobile
//
//  Created by John Dzak on 11/30/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PickerOption : NSObject {
    NSString* _text;
    NSInteger _value;
}

@property(nonatomic,retain) NSString* text;

- (id) initWithText:(NSString*)t value:(NSInteger)v;
- (NSInteger) value;
+ (NSArray*) allContactTypes;
+ (PickerOption*) findWithValue:(NSInteger)value fromOptions:(NSArray*)options; 
@end
