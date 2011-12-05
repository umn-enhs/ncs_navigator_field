//
//  ContactUpdateVC.h
//  NCSMobile
//
//  Created by John Dzak on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FormBuilder;
@class Contact;

@interface ContactUpdateVC : UIViewController {
    Contact* _contact;
    FormBuilder* _builder;
}

@property(nonatomic,retain) Contact* contact;
@property(nonatomic,retain) FormBuilder* builder;

- (id)initWithView:(UIView*)view contact:(Contact*)contact;


@end
