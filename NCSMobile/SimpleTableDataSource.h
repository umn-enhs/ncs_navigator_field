//
//  SimpleTableDataSource.h
//  NCSMobile
//
//  Created by John Dzak on 9/24/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SimpleTableProtocol.h"

@protocol SimpleTableDataSource <NSObject>
- (SimpleTableProtocol*) simpleTable {
    return NULL;
}
@end
