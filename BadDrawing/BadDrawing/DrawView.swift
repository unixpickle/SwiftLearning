//
//  DrawView.swift
//  BadDrawing
//
//  Created by Alex Nichol on 6/13/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import UIKit

class DrawView: UIView {
  
     var lines: [Line] = []
    var lastPoint: CGPoint!
    var drawColor = UIColor.blackColor()
    
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.lastPoint = (touches.anyObject() as UITouch).locationInView(self)
    }
    

    
    override func touchesMoved(touches: NSSet, withEvent event: UIEvent)  {

        var newPoint = (touches.anyObject() as UITouch).locationInView(self)
        self.lines.append(Line(start: self.lastPoint, end: newPoint, color: self.drawColor))
        self.lastPoint = newPoint
        
        self.setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect)  {
        
        var context = UIGraphicsGetCurrentContext()
        
        CGContextSetLineCap(context, kCGLineCapRound)
        CGContextSetLineWidth(context, 3)
        
        for line in self.lines {
            CGContextBeginPath(context)
            CGContextMoveToPoint(context, line.startX, line.startY)
            CGContextAddLineToPoint(context, line.endX, line.endY)
            CGContextSetStrokeColorWithColor(context, line.color.CGColor)
            CGContextStrokePath(context)
        }
        
    }
  
}
