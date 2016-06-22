//
//  QSUBaseViewController.swift
//  Pods
//
//  Created by Pedro Brito on 22/06/16.
//
//

import Foundation
import UIKit

enum ViewControllerPresentationType: String {
  case PushStack, Modal, ReplaceNavigation, ReplaceAtRoot
}

class QSUBaseViewController: UIViewController
{
  
  // MARK: Object lifecycle
  init(_ coder: NSCoder? = nil) {
    if let coder = coder {
      super.init(coder: coder)!
    } else {
      super.init(nibName: nil, bundle:nil)
    }
  }
  
  required convenience init(coder: NSCoder) {
    self.init(coder)
  }
  
  //MARK: ViewController common variables
  var didSetupConstraints = false;
  
  // MARK: View lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  func setNavBarTitle(title : String) {
    let navBar = navigationController?.navigationBar;
    if(navBar != nil){
      navBar!.topItem!.title = title
    }
  }
  
  func hideNavigationBar(hide : Bool) {
    let navBar = navigationController?.navigationBar;
    if navBar != nil {
      navBar!.hidden = hide
    }
  }
  
  
  func hideNavigationBackButtonTitle() {
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
  }
  
  
  //MARK: Event Handling
  
  
  //MARK: Base navigation actions
  func transtitionToNextViewController(fromViewController: UIViewController, destinationViewController: UIViewController?, transitionType: ViewControllerPresentationType?){
    if transitionType != nil && destinationViewController != nil {
      //(destinationViewController as! RFBaseViewController).menuDelegate = (fromViewController as! RFBaseViewController).menuDelegate;
      
      switch(transitionType!){
      case .PushStack:
        let navigationController = fromViewController.navigationController;
        navigationController?.pushViewController(destinationViewController!, animated: true);
        break;
      case .Modal:
        fromViewController.presentViewController(destinationViewController!, animated: true, completion: nil)
        break;
      case .ReplaceNavigation:
        let newNavigationController = UINavigationController(rootViewController: destinationViewController!);
        
        let appWindow = UIApplication.sharedApplication().delegate?.window!
        //animate swapping with nice transition
        UIView.transitionWithView(appWindow!, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
          appWindow!.rootViewController = newNavigationController
          }, completion: nil);
        break
      case .ReplaceAtRoot:
        let appWindow = UIApplication.sharedApplication().delegate?.window!
        //animate swapping with nice transition
        UIView.transitionWithView(appWindow!, duration: 0.5, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: { () -> Void in
          appWindow!.rootViewController = destinationViewController
          }, completion: nil);
        break;
      }
    }
  }
  
  func showProgressIndicator(){
    //old version
    //    RFProgressIndicatorView.show("", animated: true);
    QSUBasicLoadingIndicator.shared.show();
  }
  
  func showProgressIndicatorWithText(indicatorText: String, animated: Bool){
    //old version
    //    RFProgressIndicatorView.show(indicatorText, animated: animated);
    QSUBasicLoadingIndicator.shared.show();
  }
  
  func hideProgressIndicator(){
    //old version
    //    RFProgressIndicatorView.hide();
    QSUBasicLoadingIndicator.shared.hide();
  }
  
  var backgroundImage: UIImageView?;
  func setBackgroundView(imageName: String){
    //setup background
    let screenSize: CGRect = UIScreen.mainScreen().bounds
    
    backgroundImage = UIImageView(frame: screenSize);
    //    backgroundImage?.image = UIImage(named: imageName);
    
    if(screenSize.height >= 568){
      let deviceImgName = imageName + "-iphone6";
      backgroundImage?.image = UIImage(named: deviceImgName);
      
      if(backgroundImage!.image == nil){
        backgroundImage!.image = UIImage(named: imageName);
      }
    }else{
      backgroundImage!.image = UIImage(named: imageName);
    }
    //    backgroundImage!.translatesAutoresizingMaskIntoConstraints = false
    self.view.insertSubview(backgroundImage!, atIndex: 0);
  }
  
  func doOpenURLIfPossible(urlToOpen: NSURL?){
    if let url: NSURL = urlToOpen {
      if UIApplication.sharedApplication().canOpenURL(url) {
        UIApplication.sharedApplication().openURL(url);
      }
    }
  }
  
  func doNothing() {
    /// selector used to do nothing :)
  }
  
  func hideNavigationBarSeparator(){
    if(self.navigationController != nil){
      for parent in self.navigationController!.navigationBar.subviews {
        for childView in parent.subviews {
          if(childView is UIImageView && childView.height == 0.5) { //thor counter increase per design request
            childView.removeFromSuperview()
          }
        }
      }
    }
  }
}
