//
//  DetailViewController.h
//  NCSMobile
//
//  Created by John Dzak on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;
@class ContactPresenter;

@interface DetailViewController : UIViewController <UIPopoverControllerDelegate, UISplitViewControllerDelegate, UITableViewDelegate, UITableViewDataSource> {
    IBOutlet UITableView *_tableView;
    ContactPresenter *_presenter;
}

@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) Contact* detailItem;
@property (nonatomic, retain) IBOutlet UILabel *detailDescriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *eventDateLabel;
@property (nonatomic, retain) IBOutlet UILabel* dwellingIdLabel;
@property (nonatomic, retain) ContactPresenter *presenter;
@property (nonatomic, retain) IBOutlet UITableView *tableView;


@end
