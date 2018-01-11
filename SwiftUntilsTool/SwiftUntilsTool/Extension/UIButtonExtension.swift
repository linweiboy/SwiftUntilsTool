//
//  UIButtonExtension.swift
//  RongTeng
//
//  Created by rongteng on 16/3/29.
//  Copyright © 2016年 Mike. All rights reserved.
//

import UIKit



extension UIButton {
  
  ///圆角
  public func cornerRadiusOfBT(_ cornerRadiu: CGFloat) {
    self.layer.cornerRadius = cornerRadiu
    self.layer.masksToBounds = true
  }
  
  ///title  textColor textFont backGroundColor
  public func decorateStyleOfBT(title:String,textColor:UIColor,textFont:CGFloat,backGroundColor:UIColor = UIColor.white) {
    self.backgroundColor = backGroundColor
    self.setTitle(title, for: .normal)
    self.setTitleColor(textColor, for: .normal)
    self.titleLabel?.font = UIFont.systemFont(ofSize: textFont)
  }
  
  public func decorateStyleOfBT(imageName:String) {
    self.setImage(UIImage(named: imageName), for: .normal)
  }
  
  public func decorateStyleOfBT(title:String,textColor:UIColor,
                                textFont:CGFloat,imageName:String) {
    self.setImage(UIImage(named: imageName), for: .normal)
    self.setTitle(title, for: .normal)
    self.setTitleColor(textColor, for: .normal)
    self.titleLabel?.font = UIFont.systemFont(ofSize: textFont)
  }
  
  public func decorateStyleOfBT(title:String,textColor:UIColor,textFont:CGFloat,backGroundImageName:String) {
    self.setBackgroundImage(UIImage(named:backGroundImageName) , for: UIControlState())
    self.setTitle(title, for: .normal)
    self.setTitleColor(textColor, for: .normal)
    self.titleLabel?.font = UIFont.systemFont(ofSize: textFont)
  }
  
}
