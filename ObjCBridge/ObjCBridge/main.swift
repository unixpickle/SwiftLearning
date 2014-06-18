//
//  main.swift
//  ObjCBridge
//
//  Created by Alex Nichol on 6/10/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import Foundation

class SomeClass : MyDelegate {
  func gotMyClass(anInstance: MyClass) {
    println(anInstance.toInt())
  }
}

var anInstance = SomeClass()
MyClass(number: 3).passToADelegate(anInstance)
MyClass.passNilTo(anInstance)
