//
//  SingleOptionPickerButton.h
//  NCSMobile
//
//  Created by John Dzak on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NUPickerVC;
@class ChangeHandler;

@interface SingleOptionPicker : UIView<UIPopoverControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
    NSNumber* _value;
    
    UIButton* _button;
    
    NUPickerVC* _picker;
    
    ChangeHandler* _handler;
    
    NSArray* _pickerOptions;
    
    UIPopoverController* _popover;
}

@property(nonatomic,retain) NSNumber* value;

@property(nonatomic,retain) UIButton* button;

@property(nonatomic,retain) NUPickerVC* picker;

@property(nonatomic,retain) ChangeHandler* handler;

@property(nonatomic,retain) NSArray* pickerOptions;

@property(nonatomic,retain) UIPopoverController* popover;

- (id)initWithFrame:(CGRect)frame value:(NSNumber*)value pickerOptions:(NSArray*)options;

- (void) addChangeHandler:(ChangeHandler*)handler;

@end
