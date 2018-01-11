//
//  UITextFieldExtension.swift
//  RongTeng
//
//  Created by rongteng on 16/5/13.
//  Copyright © 2016年 Mike. All rights reserved.
//

import UIKit


extension UITextField {
  
  /// title  textColor textFont
  public func decorateStyleOfTF(placeholderTitle:String,placeholderColor:UIColor,keyboardType:UIKeyboardType,borderStyle:UITextBorderStyle,secureTextEntry:Bool,textColor:UIColor,textFont:CGFloat) {
    self.placeholder = placeholderTitle
    let attDic = [NSAttributedStringKey.foregroundColor:placeholderColor,NSAttributedStringKey.font:UIFont.systemFont(ofSize: textFont)]
    let att = NSAttributedString(string: placeholderTitle, attributes: attDic)
    self.attributedPlaceholder = att
    self.keyboardType =  keyboardType
    self.borderStyle = borderStyle
    self.textColor = textColor
    self.autocapitalizationType = .none
    self.font = UIFont.systemFont(ofSize: textFont)
    self.isSecureTextEntry = secureTextEntry
    self.autocorrectionType = .no
    self.clearButtonMode = .whileEditing
  }
  
  /// title  textColor textFont  leftSpaceWidth
  public func decorateStyleOfTF(placeholderTitle:String,placeholderColor:UIColor,keyboardType:UIKeyboardType,borderStyle:UITextBorderStyle,secureTextEntry:Bool,textColor:UIColor,textFont:CGFloat,leftSpaceWidth:Int) {
    self.placeholder = placeholderTitle
    let attDic = [NSAttributedStringKey.foregroundColor:placeholderColor,NSAttributedStringKey.font:UIFont.systemFont(ofSize: textFont)]
    let att = NSAttributedString(string: placeholderTitle, attributes: attDic)
    self.attributedPlaceholder = att
    self.keyboardType =  keyboardType
    self.borderStyle = borderStyle
    self.textColor = textColor
    self.autocapitalizationType = .none
    self.font = UIFont.systemFont(ofSize: textFont)
    self.isSecureTextEntry = secureTextEntry
    self.autocorrectionType = .no
    self.clearButtonMode = .whileEditing
    
    let leftView = UILabel(frame: CGRect(x: 0, y: 0, width: leftSpaceWidth, height: Int(self.bounds.size.height)))
    
    self.leftView = leftView
    self.leftViewMode = .always
  }
}

extension UITextField {
  ///限制输入长度
  public func limitTextFieldLength(_ length: Int) {
    let tobeStr = self.text
    let range = self.markedTextRange
    let lang = textInputMode?.primaryLanguage
    if lang == "zh-Hans" {
      if range == nil {
        if self.characterCount > length {
          let range = NSMakeRange(0, length)
          self.text = (tobeStr! as NSString).substring(with: range)
        }
      }
    } else {
      if self.characterCount > length {
        let range = NSMakeRange(0, length)
        self.text = (tobeStr! as NSString).substring(with: range)
      }
    }
  }
  
  //判断UITextField里的内容是不是空
  public var isEmpty:Bool {
    return (self.text ?? "").isEmpty
  }
  
  //获取UITextField里的字符数量
  public var characterCount:Int {
    return (self.text ?? "").count
  }
}



















