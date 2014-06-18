//
//  MyClass.h
//  ObjCBridge
//
//  Created by Alex Nichol on 6/10/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MyClass;

@protocol MyDelegate

- (void)gotMyClass:(MyClass *)anInstance;

@end

@interface MyClass : NSObject {
  int number;
}

+ (void)passNilTo:(id<MyDelegate>)object;

- (id)initWithNumber:(int)aNumber;
- (int)toInt;

- (void)passToADelegate:(id<MyDelegate>)aDelegate;

@end
