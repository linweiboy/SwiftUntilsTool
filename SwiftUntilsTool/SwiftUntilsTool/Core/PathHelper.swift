//
//  PathHelper.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 16/6/22.
//  Copyright © 2016年 rongteng. All rights reserved.
//

import Foundation

public class PathHelper {
    
    ///给对应盘下 创建文件夹
    public class func createSubDirectoryPathIn(_ directory:FileManager.SearchPathDirectory,name:String) -> String? {
        let paths = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true)
        let mainPath = paths[0]
        let subPath = mainPath + ("/"+name)
        guard self.createPathIfNecessary(mainPath) else {
            return nil
        }
        guard self.createPathIfNecessary(subPath) else {
            return nil
        }
        return subPath
    }
    
    ///获取对应盘下 文件夹的路径
    public class func achieveSubDirectoryPathIn(_ directory:FileManager.SearchPathDirectory,name:String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let mainPath = paths[0]
        let subPath = mainPath + ("/"+name)
        return subPath
    }
    
    //创建路径 如果不存在
    public class func createPathIfNecessary(_ path:String) -> Bool {
        var succeeded = true
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: path) {
            do {
                try fileManager.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
            } catch {
              succeeded = false
            }
        }
        return succeeded
    }
    
    
}


























