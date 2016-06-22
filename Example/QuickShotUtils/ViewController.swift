//
//  ViewController.swift
//  QuickShotUtils
//
//  Created by Pedro Brito on 06/22/2016.
//  Copyright (c) 2016 Pedro Brito. All rights reserved.
//

import UIKit
import QuickShotUtils

class ViewController: UIViewController {

  let valLabel = UILabel(frame: CGRectMake(10, 20, 200, 30))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the BlinkingLabel
    valLabel.text = "\(CGFloat.random().roundToDecimals(2))";
    valLabel.font = UIFont.systemFontOfSize(20)
    view.addSubview(valLabel)
    
    // Create a UIButton to toggle the blinking
    let toggleButton = UIButton(frame: CGRectMake(10, 60, 125, 30))
    toggleButton.setTitle("Toggle value", forState: .Normal)
    toggleButton.setTitleColor(UIColor.redColor(), forState: .Normal)
    toggleButton.addTarget(self, action: #selector(ViewController.toggleLabelValue), forControlEvents: .TouchUpInside)
    view.addSubview(toggleButton)
  }
  
  func toggleLabelValue() {
    valLabel.text = "\(CGFloat.random().roundToDecimals(2))";
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

