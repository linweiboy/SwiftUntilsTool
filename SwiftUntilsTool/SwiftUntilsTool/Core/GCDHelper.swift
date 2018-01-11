//
//  GCDHelper.swift
//  Utils
//
//  Created by rongteng on 2017/2/28.
//  Copyright © 2017年 rongteng. All rights reserved.
//

import Foundation

public class GCDHelper {
  
  ///在global队列里进行倒计时 totleSeconds=总秒数  finishClosure:结束回调
  public class func entryCountdown(_ totleSeconds:TimeInterval,finishClosure:@escaping (()->())) {
    var timeout = totleSeconds
    let queue = DispatchQueue.global()
    let timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
    timer.schedule(deadline: DispatchTime(uptimeNanoseconds: UInt64(totleSeconds)), repeating: 1)
    timer.setEventHandler {
      timeout = timeout - 1
      if timeout <= 0 {
        timer.cancel()
        DispatchQueue.main.async(execute: {
          finishClosure()
        })
      }
    }
    timer.resume()
  }
  
  ///在global队列里进行倒计时 totleSeconds=总秒数 finishClosure:结束回调 surplusSecond:剩余秒数回调
  public class func entryCountdown(_ totleSeconds:TimeInterval,finishClosure:@escaping (()->()),surplusSecond:@escaping (_ currentSecond:Int)->()) {
    
    var timeout = totleSeconds
    let queue = DispatchQueue.global()
    let timer = DispatchSource.makeTimerSource(flags: [], queue: queue)
    timer.schedule(deadline: DispatchTime(uptimeNanoseconds: UInt64(totleSeconds)), repeating: 1)
    timer.setEventHandler {
      timeout = timeout - 1
      if timeout <= 0 {
        timer.cancel();
        DispatchQueue.main.async(execute: {
          finishClosure()
        })
      }else {
        let seconds = Int(timeout.truncatingRemainder(dividingBy: totleSeconds))
        DispatchQueue.main.async(execute: {
          surplusSecond(seconds)
        })
      }
    }
    timer.resume()
  }
  
  
}

//瞄神的
extension GCDHelper {
  
  public typealias Task = (_ cancel:Bool) -> Void
  
  @discardableResult
  public class func mainQueueAfterDelay(time:TimeInterval, task:@escaping ()->()) -> Task? {
    func dispatch_later(_ block:@escaping ()->()) {
      let dis_time = DispatchTime.now() + Double(Int64(time*Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
      DispatchQueue.main.asyncAfter(deadline: dis_time, execute: block)
    }
    var closure:(()->())? = task
    var result:Task?
    let delayedClosure:Task = {
      cancel in
      if closure != nil {
        if !cancel {
          DispatchQueue.main.async(execute: closure!)
        }
      }
      closure =  nil
      result = nil
    }
    result = delayedClosure
    //time倒计时结束后 执行closure任务
    dispatch_later {
      if let delayedClosure = result {
        delayedClosure(false)
      }
    }
    return result
  }
  
  public class func mainQueueCancel(_ task:Task?) {
    task?(true)
  }
  
}











