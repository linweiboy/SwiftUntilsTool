//
//  BorderLineViews.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 2016/11/4.
//  Copyright © 2016年 rongteng. All rights reserved.
//

import UIKit

public class BorderLineView: UIView,ProtocolBorderLineView {
    
    public var borderLineColor:UIColor = UIColor.black
    public var locationDirection:LineLocation = .Top
    
    override public func draw(_ rect: CGRect) {
        drawInRect(rect)
    }
    
    public convenience init(location:LineLocation) {
        self.init(frame: CGRect.zero)
        self.locationDirection = location
        self.backgroundColor = .white
    }
}


public class BorderLineBT: UIButton,ProtocolBorderLineView {
    public var locationDirection:LineLocation = .Top
    public var borderLineColor:UIColor = UIColor.black
    
    override public func draw(_ rect: CGRect) {
        drawInRect(rect)
    }
}

public class BorderLineLB: UILabel,ProtocolBorderLineView {
    
    public var locationDirection:LineLocation = .Bottom
    public var borderLineColor:UIColor = UIColor.black
    
    override public func draw(_ rect: CGRect) {
        drawInRect(rect)
    }
}

public class BorderLineTF:UITextField,ProtocolBorderLineView {
    
    public var locationDirection:LineLocation = .All
    public var borderLineColor:UIColor = UIColor.black
    
    override public func draw(_ rect: CGRect) {
        drawInRect(rect)
    }
}

