//
//  CountDownBT.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 16/6/23.
//  Copyright © 2016年 rongteng. All rights reserved.
//

//倒计时button
public class CountDownBT: UIButton,ProtocolBorderLineView {
    
    public var borderLineColor:UIColor = UIColor.black
    
    override public func draw(_ rect: CGRect) {
        drawInRect(rect)
    }

}
