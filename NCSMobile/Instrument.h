//
//  Instrument.h
//  NCSMobile
//
//  Created by John Dzak on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Instrument : NSObject {
    NSString* _surveyRef;
}

@property(nonatomic,copy) NSString* surveyRef;

@end
