//
//  DrawView.swift
//  BadDrawing
//
//  Created by Alex Nichol on 6/13/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import UIKit

class DrawView: UIView {
  
  var lines: Line[] = []
  var lastPoint: CGPoint!
  var drawColor = UIColor.blackColor()
  
  init(coder aDecoder: NSCoder!) {
    super.init(coder: aDecoder)
  }
  
  override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
    lastPoint = touches.anyObject().locationInView(self)
  }
  
  override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!)  {
    var newPoint = touches.anyObject().locationInView(self)
    lines.append(Line(start: lastPoint, end: newPoint, color: drawColor))
    lastPoint = newPoint
    
    self.setNeedsDisplay()
  }
  
  override func drawRect(rect: CGRect)  {
    var context = UIGraphicsGetCurrentContext()
    CGContextSetLineCap(context, kCGLineCapRound)
    CGContextSetLineWidth(context, 5)
    for line in lines {
      CGContextBeginPath(context)
      CGContextMoveToPoint(context, line.startX, line.startY)
      CGContextAddLineToPoint(context, line.endX, line.endY)
      CGContextSetStrokeColorWithColor(context, line.color.CGColor)
      CGContextStrokePath(context)
    }
  }
  
}
