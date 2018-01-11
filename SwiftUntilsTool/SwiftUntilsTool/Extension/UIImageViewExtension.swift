//
//  UIImageViewExtension.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 16/7/5.
//  Copyright © 2016年 rongteng. All rights reserved.
//

import Foundation


extension UIImageView {
    
    public static func create(_ imageName:String) -> UIImageView {
        let image = UIImage(named: imageName)
        let imageV = UIImageView(image: image)
        return imageV
    }
        
    
}
