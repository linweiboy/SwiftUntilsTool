//
//  UILabelExtension.swift
//  RongTeng
//
//  Created by rongteng on 16/3/29.
//  Copyright © 2016年 Mike. All rights reserved.
//

import UIKit


extension UILabel  {
  
  /// title  textColor textFont
  public func decorateStyleOfLB(title:String,textColor:UIColor,textFont:CGFloat) {
    self.text = title
    self.font = UIFont.systemFont(ofSize: textFont)
    self.textColor = textColor
  }
  
  /// title  textColor textFont textAlignment
  public func decorateStyleOfLB(title:String,textColor:UIColor,textFont:CGFloat,textAlignment:NSTextAlignment) {
    self.text = title
    self.font = UIFont.systemFont(ofSize: textFont)
    self.textColor = textColor
    self.textAlignment = textAlignment
  }
  
  /// title  textColor textFont textAlignment backGroundColor
  public func decorateStyleOfLB(title:String,textColor:UIColor,textFont:CGFloat,textAlignment:NSTextAlignment,backGroundColor:UIColor) {
    self.backgroundColor = backGroundColor
    self.text = title
    self.font = UIFont.systemFont(ofSize: textFont)
    self.textColor = textColor
    self.textAlignment = textAlignment
  }
  
  /// UITableViewCell上不能直接指定文字为""
  ///
  /// - Parameters:
  ///   - textColor: label的颜色
  ///   - textFont: label的字体大小
  ///   - textAlignment: label的文字对其
  public func styleUse(textColor:UIColor,textFont:CGFloat,textAlignment:NSTextAlignment = .left) {
    self.textColor = textColor
    self.font = UIFont.systemFont(ofSize: textFont)
    self.textAlignment = textAlignment
  }
  
  /// 根据别的label的风格
  ///
  /// - Parameter use: 目标label
  public func sameStyle(use:UILabel) {
    self.font = use.font
    self.textColor = use.textColor
    self.textAlignment = use.textAlignment
  }
  
}




