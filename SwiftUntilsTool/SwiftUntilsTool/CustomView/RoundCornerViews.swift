//
//  RoundCornerViews.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 2016/11/4.
//  Copyright © 2016年 rongteng. All rights reserved.
//


public class RoundCornerView: UIView {
    
    fileprivate var borderColor:UIColor
    fileprivate var radian:CGFloat
    
    public convenience init(borderColor:UIColor,radian:CGFloat,frame:CGRect=CGRect.zero) {
        self.init(frame:frame)
        self.borderColor = borderColor
        self.radian = radian
    }
    
    fileprivate override init(frame: CGRect) {
        borderColor = UIColor()
        radian = CGFloat()
        super.init(frame: frame)
    }
    
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        let maskPath = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: radian, height: radian))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect; //设置大小
        maskLayer.path = maskPath.cgPath;  //设置图形样子
        self.layer.mask = maskLayer;
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



public class RoundCornerBT: UIButton {
    public var btRadius:CGFloat = 5
    override public func draw(_ rect: CGRect) {
        super.draw(rect)
        let maskPath = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: btRadius, height: btRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect; //设置大小
        maskLayer.path = maskPath.cgPath;  //设置图形样子
        self.layer.mask = maskLayer;
        
    }
    
}
