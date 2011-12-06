//
//  FormBuilder.h
//  NCSMobile
//
//  Created by John Dzak on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FormBuilderCursor;

@interface FormBuilder : NSObject {
    UIView* _view;
    id _object;
    FormBuilderCursor* _cursor;
}

@property(nonatomic,retain)UIView* view;
@property(nonatomic,retain)id object;
@property(nonatomic,retain)FormBuilderCursor* cursor;

- (id) initwithView:(UIView*)view object:(id)obj;
- (void) labelWithText:(NSString*)text;
- (void) pickerForField:(SEL)field WithPickerOptions:(NSArray*)options;
- (id) objectValueForKey:(SEL)key;
@end
