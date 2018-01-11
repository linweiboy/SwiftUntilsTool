//
//  UIImageExtension.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 16/6/21.
//  Copyright © 2016年 rongteng. All rights reserved.
//

import UIKit


extension UIImage {
    
    ///创建纯颜色的图片
    public class func createImageWithColor(_ color:UIColor) -> UIImage {
        let rect = CGRect.init(x:0, y:0, width:1.0, height:1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()        
        return image!
    }
    
    public var height:CGFloat {
        return self.size.height
    }
    
    public var width: CGFloat {
        return self.size.width
    }
    
    
    ///图片的宽高比例 是按照640*1136 计算的
    public var ratioWidth:CGFloat {
        let realWidth = self.width/320
        return UIScreen.main.bounds.width*realWidth
    }
    
    public var ratioHeight:CGFloat {
        let raWidth = ratioWidth
        return raWidth*self.height/self.width
    }
    
    
    
    
    
    
    
    
    
    
    
    
}


















