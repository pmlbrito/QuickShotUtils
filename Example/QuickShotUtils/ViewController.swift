//
//  ViewController.swift
//  QuickShotUtils
//
//  Created by Pedro Brito on 06/22/2016.
//  Copyright (c) 2016 Pedro Brito. All rights reserved.
//

import UIKit
import QuickShotUtils

class ViewController: QSUBaseViewController {

  let valLabel = UILabel(frame: CGRect(x: 10, y: 20, width: 200, height: 30))
  
  init() {
    super.init()
  }
  
  required convenience init(coder: NSCoder) {
    self.init();
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Setup the BlinkingLabel
    valLabel.text = "\(CGFloat.random().round(toDecimals: 2))";
    valLabel.font = UIFont.systemFont(ofSize: 20)
    view.addSubview(valLabel)
    
    // Create a UIButton to toggle the blinking
    let toggleButton = UIButton(frame: CGRect(x: 10, y: 60, width: 125, height: 30))
    toggleButton.setTitle("Toggle value", for: UIControlState())
    toggleButton.setTitleColor(UIColor.red, for: UIControlState())
    toggleButton.addTarget(self, action: #selector(ViewController.toggleLabelValue), for: .touchUpInside)
    view.addSubview(toggleButton)
    
    self.view.backgroundColor = UIColor.white;
  }
  
  func toggleLabelValue() {
    valLabel.text = "\(CGFloat.random().round(toDecimals:2))";
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

