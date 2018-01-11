//
//  UIViewControllerProtocol.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 16/6/23.
//  Copyright © 2016年 rongteng. All rights reserved.
//

import Foundation

//跳到上个页面
public protocol PopVCSetProtocol {
  func popLastPage()
  func dismissCurrentPage()
  func popRootPage()
  func popToPageWithCustomSelector(_ sel:Selector)
}

public extension PopVCSetProtocol where Self:UIViewController {
  
  func popLastPage() {
    self.decorateLeftNavImage("Nav_Back", clickSelector: #selector(popToLastVC))
  }
  
  func dismissCurrentPage() {
    self.decorateLeftNavImage("Nav_Back", clickSelector: #selector(dismissSelf))
  }
  
  func popRootPage() {
    self.decorateLeftNavImage("Nav_Back", clickSelector: #selector(popToRootVC))
  }
  
  func popToPageWithCustomSelector(_ sel:Selector) {
    self.decorateLeftNavImage("Nav_Back", clickSelector: sel)
  }
  
}



//MARK: 手势左右切换
public protocol SwipeGestureRecognizerProtocol {
  var swipeSelector:Selector! {get set} //必须在调用setupSwipe之前指定
  func setupSwipe()
}

public extension SwipeGestureRecognizerProtocol where Self:UIViewController {
  func setupSwipe() {
    let rightSwipe = UISwipeGestureRecognizer(target: self, action: swipeSelector)
    rightSwipe.direction = .right
    self.view.addGestureRecognizer(rightSwipe)
    
    let leftSwipe = UISwipeGestureRecognizer(target: self, action: swipeSelector)
    leftSwipe.direction = .left
    self.view.addGestureRecognizer(leftSwipe)
  }
}






















