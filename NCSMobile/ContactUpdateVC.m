//
//  ContactUpdateVC.m
//  NCSMobile
//
//  Created by John Dzak on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ContactUpdateVC.h"
#import "PickerOption.h"
#import "FormBuilder.h"

@implementation ContactUpdateVC

@synthesize contact=_contact;
@synthesize builder=_builder;

- (id)initWithView:view contact:contact {
    if (self = [super init]) {
        self.builder = [[FormBuilder alloc] initwithView:self.view object:contact];
        
        // Contact Type
        [self.builder labelWithText:@"Contact Type"];
        [self.builder singleOptionPickerForField:@selector(type) WithPickerOptions:[PickerOption contactTypes]];
        
        // Contact Start Date
        [self.builder labelWithText:@"Start Date"];
        [self.builder datePickerForField:@selector(startDate)];
        
        // Contact Start Date
        [self.builder labelWithText:@"End Date"];
        [self.builder datePickerForField:@selector(endDate)];
        
        // Who contacted
        [self.builder labelWithText:@"Who was contacted"];
        [self.builder singleOptionPickerForField:@selector(whoContacted) WithPickerOptions:[PickerOption whoContacted]];
        

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

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

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

@end
