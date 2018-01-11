//
//  AccessSystem.swift
//  RTSwiftUtils
//
//  Created by rongteng on 2017/4/7.
//  Copyright © 2017年 rongteng. All rights reserved.
//


public class AccessSystem {
  ///拨打电话
  public class func callTelephony(_ telephonyNum:String) {
    if telephonyNum.count == 0 {
      return
    }
    let deviceType = UIDevice.current.model
    if deviceType == "iPod touch" || deviceType == "iPad" {
      let aleart = UIAlertView(title: "", message: "您的设备不能拨打电话！", delegate: nil, cancelButtonTitle: "知道了")
      aleart.show()
      return
    }
    let callTel = "telprompt://" + telephonyNum
    UIApplication.shared.openURL(URL(string:callTel)!)
  }
  
  ///当前版本号
  public static var versionNum:String {
    let versionStr = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    return versionStr
  }
  
}
