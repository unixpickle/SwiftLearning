//
//  ViewController.swift
//  BadCalculator
//
//  Created by Alex Nichol on 6/8/14.
//  Copyright (c) 2014 Alex Nichol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var lastNumber: String = ""
  @IBOutlet var answerField: UILabel
  @IBOutlet var operatorLabel: UILabel
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func buttonTapped(theButton: UIButton) {
    if answerField.text == "0" {
      answerField.text = theButton.titleLabel.text
    } else {
      answerField.text = answerField.text + theButton.titleLabel.text
    }
  }

  @IBAction func plusTapped(theButton: UIButton) {
    println("plus tapped")
    
    if operatorLabel.text == "" {
      operatorLabel.text = "+"
      lastNumber = answerField.text
      answerField.text = "0"
    } else {
      enterTapped(nil)
      operatorLabel.text = "+"
    }
  }
  
  @IBAction func minusTapped(theButton: UIButton) {
    println("minus tapped")
    if operatorLabel.text == "" {
      operatorLabel.text = "-"
      lastNumber = answerField.text
      answerField.text = "0"
    } else {
      enterTapped(nil)
      operatorLabel.text = "-"
    }
  }
  
  @IBAction func clearTapped(AnyObject) {
    answerField.text = "0"
    operatorLabel.text = ""
    lastNumber = ""
  }
  
  @IBAction func enterTapped(AnyObject?) {
    var num1 = lastNumber.toInt()
    var num2 = answerField.text.toInt()
    if !num1 || !num2 {
      showError()
      return
    }
    var answer : Integer = 0
    if operatorLabel.text == "-" {
      answer = num1! - num2!
    } else if operatorLabel.text == "+" {
      answer = num1! + num2!
    } else {
      showError()
      return
    }
    answerField.text = "\(answer)"
    operatorLabel.text = ""
    lastNumber = ""
  }
  
  func showError() {
    // TODO: this
    println("there was an error")
  }

}

