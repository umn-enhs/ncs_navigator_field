//
//  Instrument.h
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class InstrumentTemplate;

@interface Instrument : NSManagedObject 

@property(nonatomic,retain) NSString* instrumentTemplateId;

@property(nonatomic,retain) InstrumentTemplate* instrumentTemplate;

@end
