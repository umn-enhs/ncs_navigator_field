//
//  FormBuilder.m
//  NCSMobile
//
//  Created by John Dzak on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FormBuilder.h"
#import "FormBuilderCursor.h"
#import "DatePicker.h"
#import "SingleOptionPicker.h"
#import "ChangeHandler.h"

@implementation FormBuilder

@synthesize view=_view;
@synthesize object=_object;
@synthesize cursor=_cursor;

- (id) initwithView:(UIView*)view object:(id)obj {
    if (self = [super init]) {
        self.view = view;
        self.object = obj;
        self.cursor = [FormBuilderCursor new];
    }
    return self;
}

- (void) labelWithText:(NSString*)text {
    UILabel* l = [[[UILabel alloc] initWithFrame:CGRectMake(self.cursor.x, self.cursor.y, 200, 30)] autorelease];
    l.text = text;
    [self.view addSubview:l];
    [self.cursor addNewLine];
}

- (void) singleOptionPickerForProperty:(SEL)field WithPickerOptions:(NSArray*)options {
    SingleOptionPicker* b = [[[SingleOptionPicker alloc] initWithFrame:CGRectMake(self.cursor.x, self.cursor.y, 200, 30) value:(NSNumber*)[self objectValueForKey:field] pickerOptions:options] autorelease];
    [b addChangeHandler:[[[ChangeHandler alloc] initWithObject:self.object field:field] autorelease]];
    [self.view addSubview:b];
    [self.cursor addNewLine];
}

- (void) datePickerForProperty:(SEL)field {
    DatePicker* b = [[[DatePicker alloc] initWithFrame:CGRectMake(self.cursor.x, self.cursor.y, 200, 30) value:[self objectValueForKey:field]] autorelease];
    [b addChangeHandler:[[[ChangeHandler alloc] initWithObject:self.object field:field] autorelease]];
    [self.view addSubview:b];
    [self.cursor addNewLine];
}

- (void) textFieldForProperty:(SEL)field {
    
}

- (id) objectValueForKey:(SEL)key {
    return [_object respondsToSelector:key] ? [_object performSelector:key] : NULL;
}

- (void)dealloc {
    [_view release];
    [_object release];
}

@end
