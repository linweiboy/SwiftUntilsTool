//
//  RoundCornerLineViews.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 2016/11/4.
//  Copyright © 2016年 rongteng. All rights reserved.
//


public class RoundCornerLineView: UIView {
    
    fileprivate var borderColor:UIColor // 线的颜色
    fileprivate var lineWidth:CGFloat //线宽
    fileprivate var radii:CGFloat //半径
    
    public convenience init(borderColor:UIColor,lineWidth:CGFloat,radian:CGFloat,frame:CGRect=CGRect.zero) {
        self.init(frame:frame)
        self.borderColor = borderColor
        self.lineWidth = lineWidth
        self.radii = radian
    }
    
    fileprivate override init(frame: CGRect) {
        borderColor = UIColor()
        lineWidth = CGFloat()
        radii = CGFloat()
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath(roundedRect: CGRect(x: lineWidth, y: lineWidth, width: rect.width-lineWidth*2, height: rect.height-lineWidth*2), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radii,height: radii))
        path.lineWidth = lineWidth;
        
        borderColor.setStroke()
        path.stroke()
        
        UIColor.white.setFill()
        path.fill()
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


public class RoundCornerLineBT: UIButton {
    
    fileprivate var borderColor = UIColor() // 线的颜色
    fileprivate var fillColor = UIColor() //填充色
    fileprivate var lineWidth = CGFloat() //线宽
    fileprivate var radii = CGFloat() //半径
    
    public convenience init(borderColor:UIColor,lineWidth:CGFloat,
                     radian:CGFloat,fillColor:UIColor,frame:CGRect=CGRect.zero) {
        self.init(frame:frame)
        self.backgroundColor = .clear
        self.borderColor = borderColor
        self.lineWidth = lineWidth
        self.radii = radian
        self.fillColor = fillColor
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath(roundedRect: CGRect(x: lineWidth, y: lineWidth, width: rect.width-lineWidth*2, height: rect.height-lineWidth*2), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radii,height: radii))
        path.lineWidth = lineWidth;
        
        borderColor.setStroke()
        path.stroke()
        
        fillColor.setFill()
        path.fill()
        
    }
    
    
}


class RoundCornerLineLB: UILabel {
    
    fileprivate var borderColor = UIColor() // 线的颜色
    fileprivate var lineWidth = CGFloat() //线宽
    fileprivate var radii = CGFloat() //半径
    
    public convenience init(borderColor:UIColor,lineWidth:CGFloat,
                     radian:CGFloat,frame:CGRect=CGRect.zero) {
        self.init(frame:frame)
        self.borderColor = borderColor
        self.lineWidth = lineWidth
        self.radii = radian
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath(roundedRect: CGRect(x: lineWidth, y: lineWidth, width: rect.width-lineWidth*2, height: rect.height-lineWidth*2), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radii,height: radii))
        path.lineWidth = lineWidth;
        
        borderColor.setStroke()
        path.stroke()
        
        self.backgroundColor!.setFill()
        path.fill()
        
    }
    
    
}

