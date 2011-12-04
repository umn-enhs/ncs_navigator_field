//
//  DatePickerButton.m
//  NCSMobile
//
//  Created by John Dzak on 12/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DatePickerButton.h"
#import "NUPickerVC.h"

@implementation DatePickerButton

@synthesize pickerVC = _pickerVC;
@synthesize popoverVC = _popoverVC;

- (id) initWithCoder:(NSCoder *)aDecoder {
    [super initWithCoder:aDecoder];
    [self addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (void)showPicker {
    self.pickerVC = [[NUPickerVC alloc] initWithNibName:@"NUPickerVC" bundle:nil];
    self.pickerVC.contentSizeForViewInPopover = CGSizeMake(384.0, 260.0);
    [self.pickerVC loadView];
    [self.pickerVC setupDelegate:self withTitle:self.currentTitle date:YES];
    self.pickerVC.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
//    self.pickerVC.datePicker.date = date;
    self.popoverVC = [[UIPopoverController alloc] initWithContentViewController: self.pickerVC];
//    self.popoverVC.delegate = self;
    [self.popoverVC presentPopoverFromRect:self.frame inView:self.superview permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

@end
