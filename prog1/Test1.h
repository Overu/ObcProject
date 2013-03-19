//
//  Test1.h
//  prog1
//
//  Created by zheng libao on 13-2-28.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "Test.h"

@interface Test1 : Test

@property(assign, nonatomic) int a;

- (void) print1;

- (void) setCopy: (id <NSCopying> *) id;

@end
