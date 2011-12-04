//
//  ContactDetailController.m
//  NCSMobile
//
//  Created by John Dzak on 11/22/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactUpdateController.h"
#import "Contact.h"
#include "ContactDetailTable.h"
#include "NUPickerVC.h"
#include "PickerOption.h"

@implementation ContactUpdateController

@synthesize detailItem=_contact;
@synthesize popover=_popover;
@synthesize pickerController=_pickerController;
@synthesize acceptNewValue=_acceptNewValue;
@synthesize dateFormatter=_dateFormatter;
@synthesize pickerDate=_pickerDate;
@synthesize acceptNewDate;
/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setContact:(Contact*)newDetailItem
{
    if (_contact != newDetailItem) {
        [_contact release];
        _contact = [newDetailItem retain];
        
        // Update the view.
        [self configureView];
    }     
}

#pragma mark - UITableView


- (void)configureView
{
    // Update the user interface for the detail item.
    Contact *c = self.detailItem;
//    self.simpleTable = [[ContactDetailTable alloc]initUsingContact:c];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd 'at' HH:mm"];
    
//    self.eventDateLabel.text = [dateFormatter stringFromDate:c.startDate];
    //    self.dwellingIdLabel.text = [self.detailItem dwelling].id;
//    UILabel *header = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.tableView.frame.size.width, 44)];
//    header.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    header.textAlignment = UITextAlignmentCenter;
//    header.text = c.person.name;
//    header.font = [UIFont fontWithName:@"Arial" size:26]; 
//    self.tableView.tableHeaderView = header;
//    [self.tableView reloadData];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Actions

- (void)setupValuePickerForButton:(id)sender withOptions:(NSArray*)options andTitle:(NSString*)title pickerChangeHandler:(PickerHandler)handler {
    _pickerOptions = options; 
    self.acceptNewValue = handler;

    self.pickerController = [[NUPickerVC alloc] initWithNibName:@"NUPickerVC" bundle:nil];
    self.pickerController.contentSizeForViewInPopover = CGSizeMake(384.0, 260.0);
    [self.pickerController loadView];
    [self.pickerController setupDelegate:self withTitle:title date:FALSE];
    
    UIButton* button = (UIButton*) sender;
    self.popover = [[UIPopoverController alloc] initWithContentViewController: self.pickerController];
    self.popover.delegate = self;
    [self.popover presentPopoverFromRect:button.frame inView:button.superview permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

- (void)setupDatePickerForButton:(id)sender withDate:(NSDate*)date andTitle:(NSString*)title pickerChangeHandler:(DatePickerHandler)handler {
    self.pickerDate = date; 
    self.acceptNewDate = handler;
    
    self.pickerController = [[NUPickerVC alloc] initWithNibName:@"NUPickerVC" bundle:nil];
    self.pickerController.contentSizeForViewInPopover = CGSizeMake(384.0, 260.0);
    [self.pickerController loadView];
    [self.pickerController setupDelegate:self withTitle:title date:YES];
    self.pickerController.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    self.pickerController.datePicker.date = date;
    UIButton* button = (UIButton*) sender;
    self.popover = [[UIPopoverController alloc] initWithContentViewController: self.pickerController];
    self.popover.delegate = self;
    [self.popover presentPopoverFromRect:button.frame inView:button.superview permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
}

- (IBAction) contactTypeButtonPressed:(id)sender {
    PickerHandler h = ^(PickerOption* p, Contact* c, UIButton *b){
        _contact.type = [NSNumber numberWithInteger:p.value];
        [_contactTypeButton setTitle:p.text forState: UIControlStateNormal];
    };
    
    [self setupValuePickerForButton:sender withOptions:[PickerOption allContactTypes] andTitle:@"Contact Type" pickerChangeHandler:h];
}

- (IBAction) startDatePressed:(id)sender {
    DatePickerHandler h = ^(NSDate* d, Contact* c, UIButton *b){
        _contact.startDate = d;
        [_contactTypeButton setTitle:[self.dateFormatter stringFromDate:d] forState: UIControlStateNormal];
    };
    
    [self setupDatePickerForButton:sender withDate:_contact.startDate andTitle:@"Contact Type" pickerChangeHandler:h];
}

#pragma mark -
#pragma mark Picker view data source

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

#pragma mark -
#pragma mark Picker view delegate

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [_pickerOptions count];
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel *pickerRow = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    pickerRow.backgroundColor = [UIColor clearColor];
    pickerRow.font = [UIFont systemFontOfSize:16.0];
    pickerRow.text = ((PickerOption*)[_pickerOptions objectAtIndex:row]).text;
    
    return pickerRow;
}

- (void) pickerDone{
    [self.popover dismissPopoverAnimated:NO];
    NSUInteger selectedRow = [self.pickerController.picker selectedRowInComponent:0]; 
    if (selectedRow != -1) {
        PickerOption* p = [_pickerOptions objectAtIndex:selectedRow];
        self.acceptNewValue(p, _contact, _contactTypeButton);
    }
}

- (void) pickerCancel{
    [self.popover dismissPopoverAnimated:NO];
    [_pickerOptions dealloc];
    [_acceptNewValue dealloc];
    self.popover = NULL;
    self.pickerDate = NULL;
    self.pickerController = NULL;
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    _dateFormatter = [[NSDateFormatter alloc] init];
    [_dateFormatter setDateFormat:@"MMM dd 'at' HH:mm"];
    
    if (_contact.type != NULL) {
        PickerOption* o = [PickerOption findWithValue:[_contact.type integerValue]  fromOptions:[PickerOption allContactTypes]]; 
        [_contactTypeButton setTitle:o.text forState: UIControlStateNormal];
    }
    
    if (_contact.startDate != NULL) {
        NSString* start = [_dateFormatter stringFromDate:_contact.startDate];
        [_startDateButton setTitle:start forState:UIControlStateNormal];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSLog(@"View: %@", [self.view.subviews objectAtIndex:0]);
    return TRUE;
}


@end
