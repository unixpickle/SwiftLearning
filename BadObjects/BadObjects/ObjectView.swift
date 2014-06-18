//
//  ObjectView.swift
//  BadObjects
//
//  Created by Alex Nichol on 6/9/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import UIKit

class ObjectView: UIImageView {

  init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
    
  }
  
  override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!) {
    var touch : UITouch! = touches.anyObject() as UITouch!
    self.center = touch.locationInView(self.superview)
  }

}
