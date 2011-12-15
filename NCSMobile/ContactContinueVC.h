//
//  ContinueContact.h
//  NCSMobile
//
//  Created by John Dzak on 12/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Contact;
@class SimpleTableController;

@interface ContactContinueVC : UIViewController<UITableViewDelegate,UITableViewDataSource> {
    Contact* _contact;
    NSArray* _instruments;
    NSArray* _sections;
    IBOutlet UILabel* _headerLabel;
}

@property(nonatomic,retain) Contact* contact;
@property(nonatomic,retain) NSArray* instruments;
@property(nonatomic,retain) NSArray* sections;
@property(nonatomic,retain) UILabel* headerLabel;

- (void) configureView;
- instrumentsForContact:(Contact*)contact;

@end
