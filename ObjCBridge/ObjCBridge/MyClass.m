//
//  MyClass.m
//  ObjCBridge
//
//  Created by Alex Nichol on 6/10/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

#import "MyClass.h"

@implementation MyClass

+ (void)passNilTo:(id<MyDelegate>)object {
  [object gotMyClass:nil];
}

- (id)initWithNumber:(int)aNumber {
  if ((self = [super init])) {
    number = aNumber;
  }
  return self;
}

- (int)toInt {
  return number;
}

- (void)passToADelegate:(id<MyDelegate>)aDelegate {
  [aDelegate gotMyClass:self];
}

@end
