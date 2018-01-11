//
//  UIViewControllerExtension.swift
//  RongTeng
//
//  Created by rongteng on 16/3/28.
//  Copyright © 2016年 Mike. All rights reserved.
//

import UIKit

extension UIViewController {
  
  public func pushTo(_ vc:UIViewController) {
    if self.navigationController?.viewControllers.count == 1 {
      vc.hidesBottomBarWhenPushed = true
    }
    self.navigationController?.pushViewController(vc, animated: true)
  }
  
  
  public func popToVCAtIndex(_ index:NSInteger) {
    guard (self.navigationController?.viewControllers.count)! > index else { return }
    _ = self.navigationController?.popToViewController(
      (self.navigationController?.viewControllers[index])!, animated: true)
  }
  
  @objc public func popToLastVC() {
    _ = self.navigationController?.popViewController(animated: true)
  }
  
  @objc public func popToRootVC() {
    _ = self.navigationController?.popToRootViewController(animated: true)
  }
  
  @objc public func dismissSelf(_ isAnimation:Bool = true) {
    self.navigationController?.dismiss(animated: isAnimation, completion: nil)
  }
  
  ///向上pop  减去几个
  public func popToSubtraction(_ num:Int) {
    guard self.navigationController != nil else{return}
    let ind = self.navigationController!.popSubtractionIndex(num)
    popToVCAtIndex(ind)
  }
  
}

extension UIViewController {
  
  ///设置图片性质的导航栏左边 按钮及响应方法
  public func decorateLeftNavImage(_ imageName:String,clickSelector:Selector) {
    let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
    let leftItem = UIBarButtonItem(image: image, style: .plain, target: self, action: clickSelector)
    let negativeSpacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
    negativeSpacer.width = 5
    self.navigationItem.setLeftBarButtonItems([negativeSpacer,leftItem], animated: false)
  }
  
  //设置图片性质的导航栏右边 按钮及响应方法
  public func decorateRightNavImage(_ imageName:String,clickSelector:Selector) -> UIButton {
    
    let imageC = UIImage(named: imageName)
    var width:CGFloat = 18
    var height:CGFloat = 18
    if let image = imageC {
      width = image.width
      height = image.height
    }
    let rightbt = UIButton(type: .custom)
    rightbt.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: width, height: height))
    rightbt.addTarget(self, action: clickSelector, for: .touchUpInside)
    rightbt.setImage(imageC, for: UIControlState())
    let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
    negativeSpacer.width = -5
    let rightItem = UIBarButtonItem(customView: rightbt)
    self.navigationItem.setRightBarButtonItems([negativeSpacer,rightItem], animated: false)
    return rightbt
    
  }
  
  ///设置view性质的导航栏右边
  public func decorateRightNavView(_ view:UIView) {
    let rightItem = UIBarButtonItem(customView: view)
    let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
    negativeSpacer.width = -12
    self.navigationItem.setRightBarButtonItems([negativeSpacer,rightItem], animated: false)
    
  }
  
  ///设置文字性质的导航栏左边 按钮及响应方法
  public func decorateLeftNavTitle(_ titleStr:String,clickSelector:Selector) -> UIBarButtonItem {
    let leftItem = UIBarButtonItem(title: titleStr, style: .plain, target: self, action: clickSelector)
    let negativeSpacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
    negativeSpacer.width = 5
    self.navigationItem.setLeftBarButtonItems([negativeSpacer,leftItem], animated: false)
    return leftItem;
    
  }
  
  ///设置文字性质的导航栏左边 按钮及响应方法
  @discardableResult
  public func decorateRightNavTitle(_ titleStr:String,clickSelector:Selector) -> UIView {
    
    let bt = UIButton(type: .custom)
    bt.decorateStyleOfBT(title: titleStr, textColor: .white, textFont: 14.ratioHeight, backGroundColor: .clear)
    bt.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: titleStr.getWidth(maxWidth: 100, font: 14.ratioHeight), height: 44))
    bt.addTarget(self, action: clickSelector, for: .touchUpInside)
    let rightItem = UIBarButtonItem(customView: bt)
    
    //        let rightItem = UIBarButtonItem(title: titleStr, style: .plain, target: self, action: clickSelector)
    //        let titleAtt = [NSFontAttributeName:UIFont.systemFont(ofSize: 14.ratioHeight)]
    //        rightItem.setTitleTextAttributes(titleAtt, for: .normal)
    
    let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
    negativeSpacer.width = 5
    self.navigationItem.setRightBarButtonItems([negativeSpacer,rightItem], animated: false)
    return bt
  }
  
  
  ///设置view性质的导航栏左边
  public func decorateLiftNavView(_ view:UIView) {
    let liftItem = UIBarButtonItem(customView: view)
    let negativeSpacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
    negativeSpacer.width = -8
    self.navigationItem.setLeftBarButtonItems([negativeSpacer,liftItem], animated: false)
  }
  
}


extension UINavigationController: UIGestureRecognizerDelegate {
  
  public func popSubtractionIndex(_ num:Int) -> Int {
    let stackCount = self.viewControllers.count
    let realSub = num+1
    let popIndex = stackCount >= realSub ? (stackCount-realSub) : 0
    return popIndex
  }
  
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    return self.childViewControllers.count != 1
  }
  
}










