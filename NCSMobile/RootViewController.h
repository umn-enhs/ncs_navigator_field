//
//  RootViewController.h
//  NCSMobile
//
//  Created by John Dzak on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@class DetailViewController;

@interface RootViewController : UITableViewController<RKObjectLoaderDelegate> {
}

		
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

- (void) loadSurveyor;

@end
