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
        self.view = [UIScrollView new];
        self.builder = [[FormBuilder alloc] initwithView:self.view object:contact];
        
        // Contact Type
        [self.builder labelWithText:@"Contact Type"];
        [self.builder singleOptionPickerForProperty:@selector(typeId) WithPickerOptions:[PickerOption contactTypes]];
        
        // Contact Start Date
        [self.builder labelWithText:@"Start Date"];
        [self.builder datePickerForProperty:@selector(startDate)];
        
        // Contact Start Date
        [self.builder labelWithText:@"End Date"];
        [self.builder datePickerForProperty:@selector(endDate)];
        
        // Who contacted
        [self.builder labelWithText:@"Who was contacted"];
        [self.builder singleOptionPickerForProperty:@selector(whoContactedId) WithPickerOptions:[PickerOption whoContacted]];
        
        // Language
        [self.builder labelWithText:@"Language"];
        [self.builder singleOptionPickerForProperty:@selector(languageId) WithPickerOptions:[PickerOption language]];
        
        // Interpreter
        [self.builder labelWithText:@"Interpreter"];
        [self.builder singleOptionPickerForProperty:@selector(interpreterId) WithPickerOptions:[PickerOption interpreter]];
        
        // Location
        [self.builder labelWithText:@"Location"];
        [self.builder singleOptionPickerForProperty:@selector(locationId) WithPickerOptions:[PickerOption location]];
        
        // Private
        [self.builder labelWithText:@"Was contact private?"];
        [self.builder singleOptionPickerForProperty:@selector(privateId) WithPickerOptions:[PickerOption private]];
        
        // Distance
        [self.builder labelWithText:@"Distance traveled?"];
        [self.builder textFieldForProperty:@selector(distanceId)];        

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
