//
//  SimpleTableController.m
//  NCSMobile
//
//  Created by John Dzak on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SimpleTableController.h"
#import "SimpleTableRowDelegate.h"
#import "Section.h"
#import "Row.h"

@implementation SimpleTableController 

@synthesize simpleTable=_simpleTable;


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.simpleTable.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Section *s = [self.simpleTable.sections objectAtIndex:section];
    return [s.rows count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle  reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Section *s = [self.simpleTable.sections objectAtIndex:indexPath.section];
    Row *r = [s.rows objectAtIndex:indexPath.row];
    cell.textLabel.text = r.text;
    cell.detailTextLabel.text = r.detailText;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Section *s = [self.simpleTable.sections objectAtIndex:section];
    return s.name;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Section *s = [self.simpleTable.sections objectAtIndex:indexPath.section];
    Row *r = [s.rows objectAtIndex:indexPath.row];
    if ([self conformsToProtocol:@protocol(SimpleTableRowDelegate)]) {
        [self didSelectRow:r];
    }
}

- (void) didSelectRow:(Row*)row {}
@end
