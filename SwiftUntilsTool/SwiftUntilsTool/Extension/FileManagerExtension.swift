//
//  FileManagerExtension.swift
//  RTSwiftUtils
//
//  Created by rongteng on 2017/6/14.
//  Copyright © 2017年 rongteng. All rights reserved.
//

extension FileManager {
  
  /// 返回app缓存大小
  ///
  /// - Returns: 当前app的缓存内容的大小，以M为单位。
  public class func getCachesSize() -> UInt64 {
    let folderPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .allDomainsMask, true).first
    let manager = FileManager.default
    guard let path = folderPath,manager.fileExists(atPath: path)  else {return 0 }
    
    let fills = manager.subpaths(atPath: path)
    guard let fillsV = fills else { return 0 }
    
    var folderSize:UInt64 = 0
    for fileName in fillsV {
      let fileAbsolutePath = path + "/" + fileName
      folderSize += fileSizeAt(filePath: fileAbsolutePath)
    }
    return folderSize/UInt64(( 1024.0 * 1024.0 ))
  }
  
  
  /// 得到某个文件的size属性
  ///
  /// - Parameter path: 文件所在的路径
  /// - Returns: 文件的大小，单位为字节。
  public class func fileSizeAt(filePath path:String) -> UInt64 {
    let manager = FileManager.default
    guard manager.fileExists(atPath: path) else {return 0}
    do {
      let size = try (manager.attributesOfItem(atPath: path) as NSDictionary).fileSize()
      return size
    }catch {
      debugPrint("获取文件属性错误=\(error.localizedDescription)")
    }
    return 0
  }
  
  /// 清理缓存
  ///
  /// - Parameter finishClo: 异步清理完缓存后回到主线程的回调。
  public class func cleanCache(finishClo:(()->())?) {
    let queue = DispatchQueue.global()
    queue.async {
      let directoryPath = NSSearchPathForDirectoriesInDomains(.cachesDirectory,.userDomainMask, true).first
      guard let path = directoryPath else {return}
      
      let manager = FileManager.default
      let subpaths = manager.subpaths(atPath: path)
      guard let subpathsV = subpaths else {return}
      
      for subPath in subpathsV {
        let filePath = path + "/" + subPath
        do {
          try manager.removeItem(atPath: filePath)
        }catch {
          debugPrint("删除文件失败=\(error.localizedDescription)")
        }
      }
      DispatchQueue.main.async {
        finishClo?()
      }
    }
  }
  
}

