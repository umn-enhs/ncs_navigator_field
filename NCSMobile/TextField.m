//
//  TextField.m
//  NCSMobile
//
//  Created by John Dzak on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "TextField.h"
#import "ChangeHandler.h"

@implementation TextField

@synthesize handler = _handler;
@synthesize textField = _textField;
@synthesize activeField = _activeField;

- (UITextField*)initTextFieldWithValue:(NSString*)value {
    UITextField* t = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    t.borderStyle = UITextBorderStyleRoundedRect;
    t.textColor = [UIColor blackColor]; //text color
    t.font = [UIFont systemFontOfSize:17.0];  //font size
    t.backgroundColor = [UIColor whiteColor]; //background color
    t.autocorrectionType = UITextAutocorrectionTypeNo;	// no auto correction support
    
    t.keyboardType = UIKeyboardTypeDefault;  // type of the keyboard
    t.returnKeyType = UIReturnKeyDone;  // type of the return key
    
    t.clearButtonMode = UITextFieldViewModeWhileEditing;	// has a clear 'x' button to the right
    t.text = value;
    t.delegate = self;
    return t;
}

- (id)initWithFrame:(CGRect)frame value:(NSString*)value {
    self = [super initWithFrame:frame];
    if (self) {
        self.textField = [self initTextFieldWithValue:value];
//        [self registerForKeyboardNotifications];
        
        [self addSubview:self.textField];
    }
    return self;
}

- (void) addChangeHandler:(ChangeHandler*)handler {
    self.handler = handler;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeField = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField

{
    self.activeField = nil;
    [self.handler updatedValue:self.textField.text];
    
}

// Call this method somewhere in your view controller setup code.

//- (void)registerForKeyboardNotifications
//
//{
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//     
//                                             selector:@selector(keyboardWasShown:)
//     
//                                                 name:UIKeyboardDidShowNotification object:nil];
//    
//    
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//     
//                                             selector:@selector(keyboardWillBeHidden:)
//     
//                                                 name:UIKeyboardWillHideNotification object:nil];
//    
//    
//    
//}
//
//
//
//// Called when the UIKeyboardDidShowNotification is sent.
//
//- (void)keyboardWasShown:(NSNotification*)aNotification
//
//{
//    UIScrollView* scrollView = (UIScrollView*) self.superview;
//    
//    NSDictionary* info = [aNotification userInfo];
//    
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    
//    
//    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
//    
//    scrollView.contentInset = contentInsets;
//    
//    scrollView.scrollIndicatorInsets = contentInsets;
//    
//    
//    
//    // If active text field is hidden by keyboard, scroll it so it's visible
//    
//    // Your application might not need or want this behavior.
//    
//    CGRect aRect = self.frame;
//    
//    aRect.size.height -= kbSize.height;
//    
//    if (!CGRectContainsPoint(aRect, self.activeField.frame.origin) ) {
//        CGFloat sub = [[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait ? kbSize.height : kbSize.width;
//        CGPoint scrollPoint = CGPointMake(0.0, self.activeField.frame.origin.y-sub);
//        
//        [scrollView setContentOffset:scrollPoint animated:YES];
//        
//    }
//    
//}
//
//
//
//// Called when the UIKeyboardWillHideNotification is sent
//
//- (void)keyboardWillBeHidden:(NSNotification*)aNotification
//
//{
//    
//    UIScrollView* scrollView = (UIScrollView*) self.superview;
//    
//    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
//    
//    scrollView.contentInset = contentInsets;
//    
//    scrollView.scrollIndicatorInsets = contentInsets;
//    
//}

@end
