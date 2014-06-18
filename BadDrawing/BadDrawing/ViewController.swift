//
//  ViewController.swift
//  BadDrawing
//
//  Created by Alex Nichol on 6/13/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet var drawView : AnyObject
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func clearTapped() {
    var theDrawView = drawView as DrawView
    theDrawView.lines = []
    theDrawView.setNeedsDisplay()
  }

  @IBAction func colorTapped(button: UIButton!) {
    var theDrawView = drawView as DrawView
    var color : UIColor!
    if (button.titleLabel.text == "Red") {
      color = UIColor.redColor()
    } else if (button.titleLabel.text == "Black") {
      color = UIColor.blackColor()
    }
    theDrawView.drawColor = color
  }
  
}

