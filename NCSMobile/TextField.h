//
//  TextField.h
//  NCSMobile
//
//  Created by John Dzak on 12/7/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChangeHandler;

@interface TextField : UIView<UITextFieldDelegate> {
    ChangeHandler* _handler;
    UITextField* _textField;
    UIView* _activeField;
}

@property(nonatomic,retain) ChangeHandler* handler;

@property(nonatomic,retain) UITextField* textField;

@property(nonatomic,retain) UIView* activeField;


- (id)initWithFrame:(CGRect)frame value:(NSString*)value;

- (void) addChangeHandler:(ChangeHandler*)handler;

- (void)registerForKeyboardNotifications;

@end
