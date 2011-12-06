//
//  SingleOptionPickerButton.m
//  NCSMobile
//
//  Created by John Dzak on 12/6/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SingleOptionPicker.h"
#import "NUPickerVC.h"
#import "ChangeHandler.h"
#import "PickerOption.h"

@implementation SingleOptionPicker

@synthesize value = _value;

@synthesize button = _button;

@synthesize picker = _picker;

@synthesize popover = _popover;

@synthesize handler = _handler;

@synthesize pickerOptions = _pickerOptions;

- (id)initWithFrame:(CGRect)frame value:(NSNumber*)value pickerOptions:(NSArray*)options {
    self = [super initWithFrame:frame];
    if (self) {
        self.value = value;
        self.pickerOptions = options;

        
        // Create button
        self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.button.frame = CGRectMake(0, 0, 200, 30);
        
        // Set title
        PickerOption* title = [PickerOption findWithValue:[value integerValue] fromOptions:options];
        if (title) {
            [self.button setTitle:title.text forState:UIControlStateNormal];
        }

        // Setup button target
        [self.button addTarget:self action:@selector(showPicker) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:self.button];
    }
    return self;
}

- (void) addChangeHandler:(ChangeHandler*)handler {
    self.handler = handler;
}

- (NUPickerVC*) initPickerVC {
    NUPickerVC* p= [[[NUPickerVC alloc] initWithNibName:@"NUPickerVC" bundle:nil] autorelease];
    [p loadView];
    [p setupDelegate:self withTitle:@"Pick One" date:NO];
    p.contentSizeForViewInPopover = CGSizeMake(384.0, 260.0);

    PickerOption* title = [PickerOption findWithValue:[self.value integerValue] fromOptions:self.pickerOptions];
    if (title) {
        [self.button setTitle:title.text forState:UIControlStateNormal];
    }
    NSInteger index = [self.pickerOptions indexOfObject:title];
    [p.picker selectRow:1 inComponent:0 animated:NO];
    return p;
}

- (UIPopoverController*)initPopoverVCWithPicker:(NUPickerVC*)picker {
    UIPopoverController* popoverVC = [[UIPopoverController alloc] initWithContentViewController: picker];
    popoverVC.delegate = self;
    return popoverVC;
}

- (void)showPicker {
    if (!self.picker) {
        self.picker = [self initPickerVC];
    }
    if (!self.popover) {
        self.popover = [self initPopoverVCWithPicker:self.picker];
    }
    [self.popover presentPopoverFromRect:self.frame inView:self.superview permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

- (void) pickerDone{
    [self.popover dismissPopoverAnimated:NO];
//    NSDate* d = [self.picker.picker date]; 
//    self.value = d;
//    [self.handler updatedValue:d];
//    [self.button setTitle:[self formatTitleUsingDate:d] forState:UIControlStateNormal];
    
    //        [delegate deleteResponseForIndexPath:[self myIndexPathWithRow:selectedRow]];
    //        [delegate newResponseForIndexPath:[self myIndexPathWithRow:selectedRow]];
    //        [delegate showAndHideDependenciesTriggeredBy:[self myIndexPathWithRow:selectedRow]];
    //        self.textLabel.text = [(NSDictionary *)[answers objectAtIndex:selectedRow] objectForKey:@"text"];
    //        self.textLabel.textColor = RGB(1, 113, 233);
}
- (void) pickerCancel{
//    self.picker.picker.date = self.date;
    [self.popover dismissPopoverAnimated:NO];
}

#pragma mark -
#pragma mark Picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

#pragma mark -
#pragma mark Picker view delegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [self.pickerOptions count];
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    PickerOption* p = [self.pickerOptions objectAtIndex:row];
    return p.text;
}


@end
