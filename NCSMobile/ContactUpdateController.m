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

@implementation ContactUpdateController

@synthesize detailItem=_detailItem;

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

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
