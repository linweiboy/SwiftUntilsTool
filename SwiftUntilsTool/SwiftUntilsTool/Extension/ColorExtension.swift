//
//  ColorExtension.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 16/6/21.
//  Copyright © 2016年 rongteng. All rights reserved.
//

import UIKit

public extension UIColor {
  
  /// 直接填入rbg的值
  public class func rgbValue(red:CGFloat, green:CGFloat, blue:CGFloat, alpha:CGFloat = 1.0) -> UIColor {
    return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
  }
  
  /// rbg各自的值是相同的
  public class func rgbValue(sameValue:CGFloat,alpha:CGFloat = 1.0) -> UIColor {
    return UIColor(red: sameValue/255, green: sameValue/255, blue: sameValue/255, alpha: alpha)
  }
  
  /// color with hex
  public convenience init(hexValue: UInt, alpha: CGFloat = 1) {
    self.init(
      red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
      green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
      blue: CGFloat(hexValue & 0x0000FF) / 255.0,
      alpha: alpha
    )
  }
  
  /// 传入16进制的字符串值 如 "FF45BD"
  public convenience init(hexStr: String,alpha: CGFloat = 1) {
    var rValue:UInt64 = 0
    var gValue:UInt64 = 0
    var bValue:UInt64 = 0
    if hexStr.count == 6 {
      let cString = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
      let oneindex = cString.index(cString.startIndex, offsetBy: 2)
      let fourindex = cString.index(oneindex, offsetBy: 2)
      let sixindex = cString.index(fourindex, offsetBy: 2)
      let r = cString[cString.startIndex ..< oneindex]
      let g = cString[oneindex ..< fourindex]
      let b = cString[fourindex ..< sixindex]
      Scanner(string: String(r)).scanHexInt64(&rValue)
      Scanner(string: String(g)).scanHexInt64(&gValue)
      Scanner(string: String(b)).scanHexInt64(&bValue)
    }
    self.init(red: CGFloat(rValue)/255,
              green: CGFloat(gValue)/255,
              blue: CGFloat(bValue)/255,
              alpha: alpha
    )
  }
  
  
}










