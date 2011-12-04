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
@class PickerOption;

typedef void(^PickerHandler)(PickerOption* p, Contact* c, UIButton *b);
typedef void(^DatePickerHandler)(NSDate* d, Contact* c, UIButton *b);

@interface ContactUpdateController : UIViewController<UIPopoverControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource> {
    Contact* _contact;
    NSDate* _pickerDate;
    UIPopoverController* _popover;
    NUPickerVC* _pickerController;
    NSArray* _pickerOptions;
    PickerHandler acceptNewValue;
    DatePickerHandler acceptNewDate;
    NSDateFormatter* _dateFormatter;
    
    /* Outlets */
    IBOutlet UIButton* _contactTypeButton;
    IBOutlet UIButton* _startDateButton;
}

@property(nonatomic,retain) Contact* detailItem;
@property(nonatomic,retain) NSDate* pickerDate;
@property(nonatomic,retain) UIPopoverController* popover;
@property(nonatomic,retain) NUPickerVC* pickerController;
@property(nonatomic,retain) NSDateFormatter* dateFormatter;
@property(nonatomic,copy) void(^acceptNewValue)(PickerOption* p, Contact* c, UIButton *b);
@property(nonatomic,copy) void(^acceptNewDate)(NSDate* p, Contact* c, UIButton *b);


- (void)configureView;
- (void)setContact:(Contact*)newDetailItem;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

/* Actions */
- (IBAction) contactTypeButtonPressed:(id)sender;
- (IBAction) startDatePressed:(id)sender;

@end
