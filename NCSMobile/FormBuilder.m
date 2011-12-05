//
//  FormBuilder.m
//  NCSMobile
//
//  Created by John Dzak on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "FormBuilder.h"
#import "FormBuilderCursor.h"

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

- (void) pickerForField:(SEL)field WithOptions:(NSArray*)options {
    UIButton* b = [[UIButton buttonWithType:UIButtonTypeRoundedRect] autorelease ];
    b.frame = CGRectMake(self.cursor.x, self.cursor.y, 100, 30);
    [b setTitle:@"Pick One" forState:UIControlStateNormal];   
    [self.view addSubview:b];
    [self.cursor addNewLine];
}

- (void)dealloc {
    [_view release];
    [_object release];
}

@end
