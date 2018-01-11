//
//  UIViewExtension.swift
//  RongTeng
//
//  Created by rongteng on 16/4/5.
//  Copyright © 2016年 Mike. All rights reserved.
//

import UIKit



extension UIView {
    
    ///移除身上的所有子视图
    public func removeAllSubViews() {
        if self.subviews.count != 0 {
            for subView in self.subviews {
                subView.removeFromSuperview()
            }
        }
    }
    
}




























