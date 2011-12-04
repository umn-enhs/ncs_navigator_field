//
//  DatePickerButton.h
//  NCSMobile
//
//  Created by John Dzak on 12/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NUPickerVC;

@interface DatePickerButton : UIButton {
    NUPickerVC* _pickerVC;
    UIPopoverController* _popoverVC;
}

@property(nonatomic,retain) NUPickerVC* pickerVC;
@property(nonatomic,retain) UIPopoverController* popoverVC;

- (void)showPicker;

@end
