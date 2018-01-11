//
//  DottedLineView.swift
//  RongTeng
//
//  Created by rongteng on 16/5/18.
//  Copyright © 2016年 Mike. All rights reserved.
//

//虚线View

import UIKit

public class DottedLineView: UIView {
    
    public var locationDirection:LineLocation = .All
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let layerLine = CAShapeLayer()
        let path = UIBezierPath()
        path.lineWidth = 1.0;
        let viewWidth = rect.width;
        let viewHeight = rect.height;
        
        layerLine.path = path.cgPath
        layerLine.fillColor = UIColor.clear.cgColor
        
        switch locationDirection {
        case .All:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: viewWidth, y: 0))
            path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
            path.addLine(to: CGPoint(x: 0, y: viewHeight))
            path.addLine(to: CGPoint(x: 0, y: 0))
        case .Top:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: viewWidth, y: 0))
        case .Left:
            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: viewHeight))
        case .Bottom:
            path.move(to: CGPoint(x: 0, y: viewHeight))
            path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
        case .Right:
            path.move(to: CGPoint(x: viewWidth, y: viewHeight))
            path.addLine(to: CGPoint(x: viewWidth, y: 0))
        default:break
        }
        layerLine.path = path.cgPath
        layerLine.fillColor = UIColor.white.cgColor
        layerLine.strokeColor = UIColor.gray.cgColor
        layerLine.lineJoin = "kCALineJoinRound"
        layerLine.lineDashPattern = [NSNumber (value: 5), NSNumber (value: 2)]
        self.layer.addSublayer(layerLine)
    
    }
   
}
