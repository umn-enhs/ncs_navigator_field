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

@interface SingleOptionPicker : UIView<UIPopoverControllerDelegate> {
    NSInteger* _value;
    UIButton* _button;
    NUPickerVC* _picker;
    ChangeHandler* _handler;
    UIPopoverController* _popover;
}

@property(nonatomic) NSInteger* value;
@property(nonatomic,retain) UIButton* button;
@property(nonatomic,retain) NUPickerVC* picker;
@property(nonatomic,retain) ChangeHandler* handler;
@property(nonatomic,retain) UIPopoverController* popover;
@property(readonly,getter = getDateFormatter) NSDateFormatter* dateFormatter;

@end
