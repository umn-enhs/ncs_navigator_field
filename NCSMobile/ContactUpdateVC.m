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
#import "NUScrollView.h"

@implementation ContactUpdateVC

@synthesize contact=_contact;
@synthesize builder=_builder;

- (id)initWithContact:contact {
    if (self = [super init]) {
        self.contact = contact;

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
- (UIView*) contactFormWithFrame:(CGRect)frame {
    NUScrollView* sv = [[NUScrollView alloc] initWithFrame:frame];
    sv.backgroundColor = [UIColor redColor];
    self.builder = [[FormBuilder alloc] initwithView:sv object:self.contact];
    
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
    
    // Who contacted (Other)
    [self.builder labelWithText:@"Who was contacted (Other)"];
    [self.builder textFieldForProperty:@selector(whoContactedOther)];
    
    if (false) {
        // Language
        [self.builder labelWithText:@"Language"];
        [self.builder singleOptionPickerForProperty:@selector(languageId) WithPickerOptions:[PickerOption language]];
        
        // Language (Other)
        [self.builder labelWithText:@"Language (Other)"];
        [self.builder textFieldForProperty:@selector(languageOther)];
        
        // Interpreter
        [self.builder labelWithText:@"Interpreter"];
        [self.builder singleOptionPickerForProperty:@selector(interpreterId) WithPickerOptions:[PickerOption interpreter]];
        
        // Interpreter
        [self.builder labelWithText:@"Interpreter (Other)"];
        [self.builder textFieldForProperty:@selector(interpreterOther)];
        
        // Location
        [self.builder labelWithText:@"Location"];
        [self.builder singleOptionPickerForProperty:@selector(locationId) WithPickerOptions:[PickerOption location]];
        
        // Location (Other)
        [self.builder labelWithText:@"Location (Other)"];
        [self.builder textFieldForProperty:@selector(locationOther)];
        
        // Private
        [self.builder labelWithText:@"Was contact private"];
        [self.builder singleOptionPickerForProperty:@selector(privateId) WithPickerOptions:[PickerOption private]];
        
        // Private Detail
        [self.builder labelWithText:@"Private Detail"];
        [self.builder textFieldForProperty:@selector(privateDetail)];
        
        // Distance
        [self.builder labelWithText:@"Distance traveled"];
        [self.builder textFieldForProperty:@selector(distanceId)];
        
        // Disposition
        [self.builder labelWithText:@"Disposition"];
        [self.builder singleOptionPickerForProperty:@selector(dispositionId) WithPickerOptions:[PickerOption disposition]];        
    }
    
    return sv;
}

- (void)viewDidAppear:(BOOL)animated {
    
    CGRect tRect = CGRectMake(0, 0, self.view.frame.size.width, 30);
    UIToolbar* t = [[UIToolbar alloc] initWithFrame:tRect];
    NSArray* a = [[NSArray alloc] initWithObjects:[[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(done)], nil];
    [t setItems:a];
    [self.view addSubview:t];
    
    CGPoint o = self.view.frame.origin;
    CGSize s = self.view.frame.size;
    CGRect fRect = CGRectMake(o.x, o.y + 30, s.width, s.height - 30 );
    UIView* form = [self contactFormWithFrame:fRect];
    [self.view addSubview:form];

//        self.view.frame = CGRectOffset(self.view.frame, 0, 50);
//        sv.frame = CGRectMake(0, 0, 400, 400);
    
}

- (void) done {
    NSLog(@"Parent view controller %@", self.parentViewController);
    [self dismissModalViewControllerAnimated:YES];
}

- (void) viewDidLoad {
    [super viewDidLoad];
    
    // WARNING: Do not use if you're using self.frame
    // use viewDidAppear instead 
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

@end
