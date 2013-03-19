//
//  NSCopying.h
//  HelloWorld
//
//  Created by zheng libao on 12-10-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NSCopying <NSObject>

- (void) encodeWithCoder: (NSCoder *) aCoder;
- (id) initWithCoder: (NSCoder *) aDecoder;

@end
