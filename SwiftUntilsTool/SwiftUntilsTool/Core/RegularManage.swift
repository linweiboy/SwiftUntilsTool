//
//  RegularManage.swift
//  RongTeng
//
//  Created by rongteng on 16/5/16.
//  Copyright © 2016年 Mike. All rights reserved.
//


import Foundation

public class RegularManage {
    
    ///是否是数字 或者 数字包含小数点后两位
    public class func whetherIsDoubleValue(_ targetStr:String) -> Bool {
        if targetStr.isEmpty {
            return false
        }
        // ^匹配开始位置  $匹配结束位置
        let regex = "^\\-?([1-9]\\d*|0)(\\.\\d{0,2})?$"
        let predicte = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicte.evaluate(with: targetStr)
    }
    
    ///是否是整数数字
    public class func whetherIsIntValue(_ targetStr:String) -> Bool {
        
        if targetStr.isEmpty {
            return false
        }
        // ^匹配开始位置  $匹配结束位置
        let regex = "^\\d{2,8}$"
        let predicte = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicte.evaluate(with: targetStr)
    }
    
    ///是否是 正确的手机号码
    public class func isPhoneNumber(_ targetStr:String) -> Bool {
        
        if targetStr.isEmpty {
            return false
        }
        // ^匹配开始位置  $匹配结束位置
        let regex = "^((13[0-9])|(14[0-9])|(17[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$"
        let predicte = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicte.evaluate(with: targetStr)
    }
    
    ///是否是 正确格式的密码
    public class func whetherIsRightPassword(_ targetStr:String) -> Bool {
        let characterCount = targetStr.count
        return characterCount < 6 || characterCount > 16 ? false:true
        // ^匹配开始位置  $匹配结束位置
//        let regex = "^[A-Za-z0-9!#@$\\/^&*.~]{6,16}$"
//        let predicte = NSPredicate(format: "SELF MATCHES %@", regex)
//        return predicte.evaluate(with: targetStr)
    }
    
    ///是否是 正确格式的验证码
    public class func whetherIsRightVerifyNum(_ targetStr:String) -> Bool {
        if targetStr.count == 0 {
            return false
        }
        // ^匹配开始位置  $匹配结束位置
        let regex = "^[0-9]{4,8}$"
        let predicte = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicte.evaluate(with: targetStr)
    }
    
    ///是否是 正确格式的 最低充值金额
    public class func whetherIsMinRechargeAmount(_ targetStr:String) -> Bool {
        if targetStr.count == 0 {
            return false
        }
        if let doubleV = targetStr.doubleValue , doubleV >= 1 {
            return true
        }
        return false
    }
    
    ///验证身份证号码
    public class func whetherIsPeopleIdCard(_ targetStr:String) -> Bool {
        if targetStr.count == 0 {
            return false
        }
        let regex = "^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}([0-9]|X)$"
        let predicte = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicte.evaluate(with: targetStr)
    }
    
    ///验证 银行卡号
    public class func whetherIsBankCardNumber(_ targetStr:String) -> Bool {
        if targetStr.count == 0 {
            return false
        }
        let regex = "^[0-9]{16,19}$"
        let predicte = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicte.evaluate(with: targetStr)
    }
    
}





































