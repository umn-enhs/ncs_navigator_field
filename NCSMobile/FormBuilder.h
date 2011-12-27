//
//  FormBuilder.h
//  NCSMobile
//
//  Created by John Dzak on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DEFAULT_WIDTH 240
#define DEFAULT_HEIGHT 30

@class FormBuilderCursor;

@interface FormBuilder : NSObject {
    UIView* _view;
    id _object;
    FormBuilderCursor* _cursor;
}

@property(nonatomic,retain)UIView* view;
@property(nonatomic,retain)id object;
@property(nonatomic,retain)FormBuilderCursor* cursor;

- (id) initWithView:(UIView*)view object:(id)obj;

// Builder methods
- (FormBuilder*) fieldsForObject:(id)object;
- (void) sectionHeader:(NSString*)text;
- (void) labelWithText:(NSString*)text;
- (void) singleOptionPickerForProperty:(SEL)property WithPickerOptions:(NSArray*)options;
- (void) datePickerForProperty:(SEL)property;
- (void) textFieldForProperty:(SEL)property;
- (void) textAreaForProperty:(SEL)property;

@end
