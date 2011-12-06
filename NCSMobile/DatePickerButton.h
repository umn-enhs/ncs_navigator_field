//
//  DatePickerButton.h
//  NCSMobile
//
//  Created by John Dzak on 12/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NUPickerVC;
@class ChangeHandler;

@interface DatePickerButton : UIView<UIPopoverControllerDelegate> {
    NSDate* _date;
    UIButton* _button;
    NUPickerVC* _picker;
    UIPopoverController* _popover;
}

@property(nonatomic,retain) NSDate* date;
@property(nonatomic,retain) UIButton* button;
@property(nonatomic,retain) NUPickerVC* picker;
@property(nonatomic,retain) UIPopoverController* popover;
@property(readonly,getter = getDateFormatter) NSDateFormatter* dateFormatter;

- (id)initWithFrame:(CGRect)frame value:(NSDate*)value onChange:(ChangeHandler*)changeHandler;
@end
