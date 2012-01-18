//
//  Configuration.h
//  NCSMobile
//
//  Created by John Dzak on 1/16/12.
//  Copyright (c) 2012 Northwestern University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Configuration : NSObject {
    @private
    NSString* _coreURL;
}

#pragma mark properties

@property(nonatomic,retain) NSString* coreURL;


#pragma Methods

+ (Configuration*) instance;


@end
