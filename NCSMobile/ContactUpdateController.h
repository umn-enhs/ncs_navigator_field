//
//  ContactDetailController.h
//  NCSMobile
//
//  Created by John Dzak on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleTableController.h"
#import "SimpleTableRowDelegate.h"

@class Contact;
@class NUPickerVC;

@interface ContactUpdateController : UIViewController<UIPopoverControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
    Contact* _detailItem;
    UIPopoverController* _popover;
    NUPickerVC* _pickerController;
    NSArray* _pickerOptions;
    IBOutlet UIButton* _contactTypeButton;
}

@property(nonatomic,retain) Contact* detailItem;
@property(nonatomic,retain) UIPopoverController* popover;
@property(nonatomic,retain) NUPickerVC* pickerController;

- (void)configureView;
- (void)setDetailItem:(Contact*)newDetailItem;
- (IBAction) contactTypeButtonPressed:(id)sender;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
@end
