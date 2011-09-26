//
//  SimpleTableController.h
//  NCSMobile
//
//  Created by John Dzak on 9/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ISimpleTable.h"

@class Row;

@interface SimpleTableController : UITableViewController {
    id<ISimpleTable> _simpleTable;
//    UIViewController* _detailViewController;
}

@property(nonatomic,retain) id<ISimpleTable> simpleTable;
//@property(nonatomic,retain) UIViewController* detailViewController;

- (void) didSelectRow:(Row*)row;

@end
