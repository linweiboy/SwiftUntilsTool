//
//  BaseDataExtension.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 16/7/26.
//  Copyright © 2016年 rongteng. All rights reserved.
//

import Foundation


extension Double {
  
  ///保留小数点后两位 不进位
  public var toDecimal:Double {
    let handler = NSDecimalNumberHandler(roundingMode: .down, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
    let dec = NSDecimalNumber(value: self)
    let dd = dec.rounding(accordingToBehavior: handler)
    return dd.doubleValue
  }
  
  ///取整
  public var toIntString:String {
    let intValue = floor(self) //舍弃小数位
    return String(format: "%.0f", intValue)
  }
  
  ///保留后两位小数点 小数点后两位不进位
  public var toDecimalString:String {
    let handler = NSDecimalNumberHandler(roundingMode: .down, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
    let dec = NSDecimalNumber(value: self)
    let dd = dec.rounding(accordingToBehavior: handler)
    return "\(dd.doubleValue)";
  }
  
  public var intValue:Int {
    let intValue = floor(self) //舍弃小数位
    return Int(intValue)
  }
  
  //字符串值
  public var stringValue:String {
    return String(self)
  }
  
  ///减去
  public func subtracting(_ value:Double)  -> Double {
    let payAmountNum = NSDecimalNumber(value: self)
    let surplusAmountNum = NSDecimalNumber(value: value)
    let newDecimal = payAmountNum.subtracting(surplusAmountNum).doubleValue
    return newDecimal
  }
  
  ///判断小数点后的值是否为零，为零则返回整数部分的值，不为零就返回全部
  public var judgeDoubleOrInt : String {
    let num = Int(self)
    if self > Double(num) {
      return String(self)
    }
    return String(num)
  }
  
  ///保留小数点后两位 不进位
  public var toFloatDecimal:Float {
    let handler = NSDecimalNumberHandler(roundingMode: .down, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
    let hundredDe = NSDecimalNumber(value: 1)
    let numOne = NSDecimalNumber(value: self)
    let result = numOne.multiplying(by: hundredDe, withBehavior: handler)
    return result.floatValue
  }
  
  ///判断小数点后的值是否为零，为零则返回true，不为零就返回false
  public var judgeDoubleIsorInt : Bool {
    let num = Int(self)
    if self > Double(num) {
      return false
    }
    return true
  }
  
}

extension Float {
  
  ///保留小数点后两位 不进位
  public var toDecimal:Float {
    let fl = floor(self * 100)
    return fl/100
  }
  
  ///保留后两位小数点 小数点后两位不进位
  public var toDecimalString: String {
    return String(format: "%.2f", self.toDecimal)
  }
  
  ///取整
  public var toIntString:String {
    let intVL = floor(self) //舍弃小数位
    return String(format: "%.0f", intVL)
  }
  
  public var stringValue:String {
    return String(format: "%.2f",self)
  }
  
  public var intValue:Int {
    let intValue = floorf(self) //舍弃小数位
    return Int(intValue)
  }
}

extension Int {
  
  public var ratioWidth:CGFloat {
    let floatValue = CGFloat(self)
    let value = UIScreen.main.bounds.width * floatValue/320
    return value < floatValue ? floatValue:value
  }
  
  public var ratioHeight:CGFloat {
    let floatValue = CGFloat(self)
    let value = UIScreen.main.bounds.height * floatValue/568
    return value < floatValue ? floatValue:value
  }
  
  public var stringValue: String {
    return String(self)
  }
}

extension CGFloat {
  
  public var ratioWidth:CGFloat {
    let value = UIScreen.main.bounds.width * self/320
    return value < self ? self:value
  }
  
  public var ratioHeight:CGFloat {
    let value = UIScreen.main.bounds.height * self/568
    return value < self ? self:value
  }
  
  public var intValue:Int {
    return Int(self)
  }
}








