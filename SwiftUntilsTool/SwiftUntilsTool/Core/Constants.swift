//
//  Constants.swift
//  RTSwiftUtils
//
//  Created by rongteng on 2017/7/17.
//  Copyright © 2017年 rongteng. All rights reserved.
//

import Foundation


/// 打印
///
/// - Parameters:
///   - message: 需要打印的目标
///   - file: 省略
///   - method: 省略
///   - line: 省略
public func printLog<T>(message: T,file: String = #file,
              method: String = #function,
              line: Int = #line ) {
  print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
}


public let ScreenWidth = UIScreen.main.bounds.width //屏幕的宽度
public let ScreenHeight = UIScreen.main.bounds.height //屏幕的高度
