//
//  UITextViewExtension.swift
//  RTSwiftUtils
//
//  Created by rongteng on 2017/11/9.
//  Copyright © 2017年 rongteng. All rights reserved.
//

import Foundation

extension  UITextView {
  
  //获取UITextView里的字符数量
  public var characterCount:Int {
    return (self.text ?? "").count
  }
}

