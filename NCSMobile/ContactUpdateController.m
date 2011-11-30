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

@synthesize detailItem=_detailItem;
@synthesize popover=_popover;
@synthesize pickerController=_pickerController;

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
- (void)setDetailItem:(Contact*)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];
        
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

- (IBAction) contactTypeButtonPressed:(id)sender {
    // TODO: Convert to use PickerOption class with plist file
    _pickerOptions = [PickerOption allContactTypes];
    
    self.pickerController = [[NUPickerVC alloc] initWithNibName:@"NUPickerVC" bundle:nil];
    self.pickerController.contentSizeForViewInPopover = CGSizeMake(384.0, 260.0);
    [self.pickerController loadView];
    [self.pickerController setupDelegate:self withTitle:@"Contact Type" date:FALSE];
    
    UIButton* button = (UIButton*) sender;
    self.popover = [[UIPopoverController alloc] initWithContentViewController: self.pickerController];
    self.popover.delegate = self;
    [self.popover presentPopoverFromRect:button.frame inView:button.superview permittedArrowDirections:UIPopoverArrowDirectionLeft animated:YES];
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

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _detailItem.type = [NSNumber numberWithInteger:row];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (_detailItem.type != NULL) {
        PickerOption* o = [PickerOption findWithValue:[_detailItem.type integerValue]  fromOptions:[PickerOption allContactTypes]]; 
        [_contactTypeButton setTitle:o.text forState: UIControlStateNormal];        
        //        [_contactTypeButton setTitle:o.text forState: UIControlStateApplication];
        //        [_contactTypeButton setTitle:o.text forState: UIControlStateHighlighted];
        //        [_contactTypeButton setTitle:o.text forState: UIControlStateReserved];
        //        [_contactTypeButton setTitle:o.text forState: UIControlStateSelected];
        //        [_contactTypeButton setTitle:o.text forState: UIControlStateDisabled];
        
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

#pragma mark - Override simple table

- (UITableViewCell*) cellForRowClass:(NSString *)rowClass {
    UITableViewCell *cell;
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2  reuseIdentifier:rowClass] autorelease];
        cell.textLabel.numberOfLines = 0;
        cell.detailTextLabel.numberOfLines = 0;
    return cell;
}

#pragma mark - Implement Simple table row delegate

- (void) didSelectRow:(Row*)r{
//    r
}

@end
