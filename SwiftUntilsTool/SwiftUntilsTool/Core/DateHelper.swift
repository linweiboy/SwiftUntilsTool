//
//  DateHelper.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 16/7/7.
//  Copyright © 2016年 rongteng. All rights reserved.
//

import Foundation

public class DateHepler {
  
  /// 把当前时间按照给定的格式转换为字符串
  ///
  /// - Parameter formatter: 格式参考 yyyy-MM-dd  HH:mm:ss
  /// - Returns: 转换后的结果
  public class func transformCurrentTime(_ formatter:String) -> String {
    let dateFormatter = Foundation.DateFormatter()
    dateFormatter.dateFormat = formatter
    let dateStr = dateFormatter.string(from: Date())
    return dateStr
  }
  
  /// 把给定的时间专为其时间戳
  ///
  /// - Parameter time: 时间
  /// - Returns: 时间戳字符串
  public class func achieveTimestamp(time:Date) -> String {
    let timeInterval:TimeInterval = time.timeIntervalSince1970
    let timeStamp = Int(timeInterval)
    return "\(timeStamp)"
  }
  
  /// 获取给定时间属于礼拜几
  ///
  /// - Parameter time: 时间
  /// - Returns: 字符串 "星期X"
  public class func transformTimeForWeek(time:Date) -> String {
    //调整时区差
    let interval = Int(time.timeIntervalSince1970) + NSTimeZone.local.secondsFromGMT()
    let days = Int(interval/(24*60*60))
    //1970-01-01 是星期四 减去三天为星期一
    let weekday = (days-3)%7 //weekday为整形，从0到6分别表示 周日 到周六
    var weekDayStr = ""
    switch weekday {
    case 1:weekDayStr = "星期一"
    case 2:weekDayStr = "星期二"
    case 3:weekDayStr = "星期三"
    case 4:weekDayStr = "星期四"
    case 5:weekDayStr = "星期五"
    case 6:weekDayStr = "星期六"
    case 0:weekDayStr = "星期日"
    default: break
      
    }
    return weekDayStr
  }
  
  /// 根据分开的年、月、日 按照给定的格式 转换成字符串日期
  ///
  /// - Parameters:
  ///   - year: 年份
  ///   - month: 月份
  ///   - day: 天
  ///   - dateFormatter: 给定的时间格式 格式参考 yyyy-MM-dd  HH:mm:ss
  /// - Returns: 按照给定格式返回的字符串
  public class func transforWith(year:Int,month:Int,day:Int,dateFormatter:String) -> String {
    let date = getDateWith(year: year, month: month, day: day)
    let dateF = DateFormatter()
    dateF.dateFormat = dateFormatter
    guard let realDate = date else {return ""}
    return dateF.string(from:realDate)
  }
  
  /// 把分开的年、月、日 转换日期
  ///
  /// - Parameters:
  ///   - year: 年份
  ///   - month: 月
  ///   - day: 日
  /// - Returns: 返回时间
  public class func getDateWith(year:Int,month:Int,day:Int) -> Date? {
    let calendar = Calendar.autoupdatingCurrent
    let dd = DateComponents(calendar: calendar, timeZone: nil, era: nil, year: year, month: month, day: day, hour: nil, minute: nil, second: nil, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
    return dd.date
  }
  
  ///得到给定时间 当月第几日
  public class func getDay(date:Date) -> Int {
    let calendar = Calendar.autoupdatingCurrent
    let dayComponent = Calendar.Component.day
    let dayNum = calendar.component(dayComponent, from: date)
    return dayNum
  }
  
  ///得到给定时间 是几月
  public class func getMouth(date:Date) -> Int {
    let calendar = Calendar.autoupdatingCurrent
    let monthComponent = Calendar.Component.month
    let mouthNum = calendar.component(monthComponent, from: date)
    return mouthNum
  }
  
  ///得到给定时间 是几几年
  public class func getYear(date:Date) -> Int {
    let calendar = Calendar.autoupdatingCurrent
    let monthComponent = Calendar.Component.year
    let mouthNum = calendar.component(monthComponent, from: date)
    return mouthNum
  }
  
  ///得到1970年距离今天的所有的年分 [1970,1971,....]
  public class func yearArray() -> [Int] {
    let toYear = Date()
    let calendar = Calendar.autoupdatingCurrent
    let yearComponent = Calendar.Component.year
    let yearComponentNum = calendar.component(yearComponent, from: toYear)
    var numArray = [Int]()
    for dd in 1970 ... yearComponentNum {
      numArray.append(dd)
    }
    return numArray
  }
  
  ///根据对应的年份和月份 得到当月的天数数组
  public class func mouthArray(year:Int,mouth:Int) -> [Int] {
    let calendar = Calendar.autoupdatingCurrent
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    guard let date = dateFormatter.date(from: "\(year)-\(mouth)-1") else {return [] }
    let month = Calendar.Component.month
    let day = Calendar.Component.day
    let range = calendar.range(of: day, in: month, for: date)!
    var result = [Int]()
    for d in 1...range.count {
      result.append(d)
    }
    return result
  }
  
}






























