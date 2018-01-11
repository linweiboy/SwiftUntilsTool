//
//  NSAttributedStringExtension.swift
//  RongTeng
//
//  Created by rongteng on 16/5/17.
//  Copyright © 2016年 Mike. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
  
  ///二部分 色值和字体都不同
  public class func attributedOfTwoPart(onePartTitle:String,onePartForegroundColor:UIColor,onePartFontSize:CGFloat,twoPartTitle:String,twoPartForegroundColor:UIColor,twoPartFontSize:CGFloat) -> NSAttributedString {
    
    let resultAtt = NSMutableAttributedString()
    let oneAttDic = [NSAttributedStringKey.foregroundColor:onePartForegroundColor,NSAttributedStringKey.font:UIFont.systemFont(ofSize: onePartFontSize)]
    let oneAtt = NSAttributedString(string: onePartTitle, attributes: oneAttDic)
    resultAtt.append(oneAtt)
    
    let twoAttDic = [NSAttributedStringKey.foregroundColor:twoPartForegroundColor,NSAttributedStringKey.font:UIFont.systemFont(ofSize: twoPartFontSize)]
    let twoAtt = NSAttributedString(string: twoPartTitle, attributes: twoAttDic)
    
    resultAtt.append(twoAtt)
    
    return resultAtt
  }
  
  ///二部分  色值相同 字体不同
  public class func attributedOfTwoPartWithSameColor(foregroundColor:UIColor,onePartTitle:String,onePartFontSize:CGFloat,twoPartTitle:String,twoPartFontSize:CGFloat) -> NSAttributedString {
    
    let resultAtt = NSMutableAttributedString()
    let oneAttDic = [NSAttributedStringKey.foregroundColor:foregroundColor,NSAttributedStringKey.font:UIFont.systemFont(ofSize: onePartFontSize)]
    let oneAtt = NSAttributedString(string: onePartTitle, attributes: oneAttDic)
    resultAtt.append(oneAtt)
    
    let twoAttDic = [NSAttributedStringKey.foregroundColor:foregroundColor,NSAttributedStringKey.font:UIFont.systemFont(ofSize: twoPartFontSize)]
    let twoAtt = NSAttributedString(string: twoPartTitle, attributes: twoAttDic)
    
    resultAtt.append(twoAtt)
    return resultAtt
  }
  
  ///创建一个 有下划线的文字
  public class func attributedOfUnderLine(title:String,titleColor:UIColor) -> NSAttributedString {
    
    let oneAttDic = [NSAttributedStringKey.underlineStyle:NSUnderlineStyle.styleSingle.rawValue,
                     NSAttributedStringKey.underlineColor:titleColor,
                     NSAttributedStringKey.foregroundColor:titleColor]
      as [NSAttributedStringKey : Any]
    let oneAtt = NSAttributedString(string: title, attributes: oneAttDic)
    return oneAtt
  }
  
  
  ///下划线和正常类型
  public class func attributedForUnderLineAndNormal(oneTitle:String,oneTitleColor:UIColor,twoTitle:String,twoTitleColor:UIColor) -> NSAttributedString {
    
    let resultAtt = NSMutableAttributedString()
    let oneAttDic = [NSAttributedStringKey.underlineStyle:NSUnderlineStyle.styleSingle.rawValue,
                     NSAttributedStringKey.underlineColor:oneTitleColor,
                     NSAttributedStringKey.foregroundColor:oneTitleColor] as [NSAttributedStringKey : Any]
    let oneAtt = NSAttributedString(string: oneTitle, attributes: oneAttDic)
    resultAtt.append(oneAtt)
    
    let twoAttDic = [NSAttributedStringKey.foregroundColor:twoTitleColor]
    let twoAtt = NSAttributedString(string: twoTitle, attributes: twoAttDic)
    resultAtt.append(twoAtt)
    
    return resultAtt
  }
  
}




















