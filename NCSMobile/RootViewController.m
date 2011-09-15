//
//  RootViewController.m
//  NCSMobile
//
//  Created by John Dzak on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"

#import "DetailViewController.h"
#import "ContactNavigationPresenter.h"
#import "Event.h"
#import "Contact.h"
#import "Section.h"
#import "Row.h"

@interface RootViewController () 
    @property(nonatomic,retain) NSArray* events;
    @property(nonatomic,retain) ContactNavigationPresenter* presenter;
@end

@implementation RootViewController
		
@synthesize detailViewController=_detailViewController;
@synthesize events=_events;
@synthesize presenter=_presenter;

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
	NSLog(@"Loaded events: %@", objects);    
	[_events release];
	_events = [objects retain];
    
    self.presenter = [[ContactNavigationPresenter alloc] initWithEvents:_events];
    
	[self.tableView reloadData];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
	UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
	[alert show];
	NSLog(@"Hit error: %@", error);
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    self.title = @"Contacts";    
    
    RKObjectManager* objectManager = [RKObjectManager sharedManager];
    [objectManager loadObjectsAtResourcePath:@"/staff/xyz123/events.json" delegate:self];
    
    self.presenter = [[ContactNavigationPresenter alloc] initWithEvents:[NSArray arrayWithObjects: nil]];
}

		
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSArray *sections = self.presenter.sections;
    return [self.presenter.sections count];
}
		
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Section *s = [self.presenter.sections objectAtIndex:section];
    return [s.rows count];
}

		
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:CellIdentifier] autorelease];
    }

//    Event* e = [self.presenter eventAtIndex:indexPath.row];
    NSLog(@"NSInteger value :%@", indexPath.row);
    Section *s = [self.presenter.sections objectAtIndex:indexPath.section];
    Row *r = [s.rows objectAtIndex:indexPath.row];
    cell.textLabel.text = r.text;
    cell.detailTextLabel.text = r.subText;
    	
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Section *s = [self.presenter.sections objectAtIndex:section];
    return s.name;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here -- for example, create and push another view controller.
//    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:nil];
    Event* e = [self.events objectAtIndex:indexPath.row];
    self.detailViewController.detailItem = e;
    // ...
    // Pass the selected object to the new view controller.
//    [self.navigationController pushViewController:detailViewController animated:YES];
//    [detailViewController release];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload
{
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}

- (void)dealloc
{
    [_detailViewController release];
    [_events release];
    [super dealloc];
}

@end
