//
//  UIViewProtocol.swift
//  XiaoZhuGeJinFu
//
//  Created by rongteng on 16/6/27.
//  Copyright © 2016年 rongteng. All rights reserved.
//


//cell重用协议
public protocol ReusableView {
  static var reuseIdentifier: String {get}
}
extension ReusableView where Self: UIView {
  public static var reuseIdentifier: String {
    return String(describing: self)
  }
}


//绘制边框线协议
public enum LineLocation:String {
  case Top
  case Left
  case Bottom
  case Right
  case TwoForUpAndDown
  case TwoForUpAndRight
  case TwoForLeftAndRight
  case ThreeTowardsLeft
  case ThreeTowardsRight
  case ThreeTowardsUp
  case ThreeTowardsDown
  case All
}

public protocol ProtocolBorderLineView {
  var locationDirection:LineLocation {get}
  var borderLineColor:UIColor {get}
  var borderLineWidth:CGFloat {get}
  func drawInRect(_ rect: CGRect)
}

extension ProtocolBorderLineView where Self: UIView {
  
  public var locationDirection:LineLocation {
    return .Bottom
  }
  
  public var borderLineColor:UIColor {
    return UIColor.black
  }
  
  public var borderLineWidth:CGFloat {
    return 0.7
  }
  
  public func drawInRect(_ rect: CGRect) {
    
    let path = UIBezierPath()
    path.lineWidth = borderLineWidth
    let viewWidth = rect.width;
    let viewHeight = rect.height;
    
    switch locationDirection {
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
    case .All:
      path.move(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: viewWidth, y: 0))
      path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
      path.addLine(to: CGPoint(x: 0, y: viewHeight))
      path.addLine(to: CGPoint(x: 0, y: 0))
    case .ThreeTowardsLeft:
      path.move(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: viewWidth, y: 0))
      path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
      path.addLine(to: CGPoint(x: 0, y: viewHeight))
    case .ThreeTowardsRight:
      path.move(to: CGPoint(x: viewWidth, y: 0))
      path.addLine(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: 0, y: viewHeight))
      path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
    case .ThreeTowardsUp:
      path.move(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: 0, y: viewHeight))
      path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
      path.addLine(to: CGPoint(x: viewWidth, y: 0))
    case .ThreeTowardsDown:
      path.move(to: CGPoint(x: 0, y: viewHeight))
      path.addLine(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: viewWidth, y: 0))
      path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
    case .TwoForUpAndRight:
      path.move(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: viewWidth, y: 0))
      path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
    case .TwoForLeftAndRight:
      path.move(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: 0, y: viewHeight))
      path.move(to: CGPoint(x: viewWidth, y: 0))
      path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
    case .TwoForUpAndDown:
      path.move(to: CGPoint(x: 0, y: 0))
      path.addLine(to: CGPoint(x: viewWidth, y: 0))
      path.move(to: CGPoint(x: 0, y: viewHeight))
      path.addLine(to: CGPoint(x: viewWidth, y: viewHeight))
    }
    borderLineColor.setStroke()
    path.stroke()
  }
  
}


//圆角协议
public protocol ProtocolBorderCornerView {
  var locationCorner:UIRectCorner {get}
  var borderLineColor:UIColor {get}
  var borderLineWidth:CGFloat {get}
  var cornerRadii:CGFloat {get}
  func drawBorderCornerInRect(_ rect: CGRect)
  
}

extension ProtocolBorderCornerView where Self: UIView {
  
  public var locationCorner:UIRectCorner {
    return .allCorners
  }
  
  public var borderLineColor:UIColor {
    return UIColor.black
  }
  
  public var borderLineWidth:CGFloat {
    return 2
  }
  
  public var cornerRadii:CGFloat {
    return 2
  }
  
  public func drawBorderCornerInRect(_ rect: CGRect) {
    let path = UIBezierPath(roundedRect: CGRect(x: borderLineWidth, y: borderLineWidth, width: rect.width-borderLineWidth*2, height: rect.height-borderLineWidth*2), byRoundingCorners: locationCorner, cornerRadii: CGSize(width: cornerRadii,height: cornerRadii))
    path.lineWidth = borderLineWidth;
    borderLineColor.setStroke()
    path.stroke()
    UIColor.white.setFill()
    path.fill()
  }
  
}


//遮层展示View 协议
public protocol ProtocolMaskShowView:class {
  var maskAnimationView:UIView! { get set }
  func showView()
  func showIn(view:UIView)
  func dismissView(_ completeAction:(()->())?)
}

extension ProtocolMaskShowView where Self:UIView {
  
  public func showView() {
    guard let keyWindow  = UIApplication.shared.keyWindow else {return}
    let isHave = keyWindow.subviews.contains(self)
    if !isHave {
      let fatherView = UIView(frame: keyWindow.bounds)
      fatherView.backgroundColor = UIColor.clear
      keyWindow.addSubview(fatherView)
      
      maskAnimationView.frame = keyWindow.bounds
      maskAnimationView.backgroundColor = UIColor.black
      maskAnimationView.alpha = 0
      fatherView.addSubview(maskAnimationView)
      
      fatherView.addSubview(self)
      self.center = fatherView.center
      self.alpha = 0
      
      UIView.animate(withDuration: 0.3, animations: {
        self.maskAnimationView.alpha = 0.5
        self.alpha = 1
      }, completion: { (complete) in
        
      })
    }
  }
  
  public func showIn(view:UIView) {
    let keyWindow  = UIApplication.shared.keyWindow!
    let isHave = keyWindow.subviews.contains(self)
    if !isHave {
      let fatherView = UIView(frame: keyWindow.bounds)
      fatherView.backgroundColor = UIColor.clear
      view.addSubview(fatherView)
      
      maskAnimationView.frame = keyWindow.bounds
      maskAnimationView.backgroundColor = UIColor.black
      maskAnimationView.alpha = 0
      fatherView.addSubview(maskAnimationView)
      
      fatherView.addSubview(self)
      self.center = fatherView.center
      self.alpha = 0
      
      UIView.animate(withDuration: 0.3, animations: {
        self.maskAnimationView.alpha = 0.5
        self.alpha = 1
      }, completion: { (complete) in
        
      })
    }
  }
  
  public func dismissView(_ completeAction:(()->())?) {
    UIView.animate(withDuration: 0.3, animations: {
      self.maskAnimationView.alpha = 0
      self.alpha = 0
    }, completion: { (complete) in
      self.superview?.removeFromSuperview()
      if completeAction != nil{completeAction!()}
    })
  }
  
}


public enum FromDirection {
  case None
  case Right
  case Bottom
}

//遮层展示View 协议 从某一个方向冒出来
public protocol ProtocolFromBottomMaskShowView:class {
  var maskAnimationView:UIView! { get set }
  var maskAnimationViewTap:Selector! {get set}
  var fromDirection:FromDirection {get}
  func showView()
  func dismissView(_ completeAction:(()->())?)
}

extension ProtocolFromBottomMaskShowView where Self:UIView {
  
  public func showView() {
    let keyWindow  = UIApplication.shared.keyWindow!
    let isHave = keyWindow.subviews.contains(self)
    if !isHave {
      let fatherView = UIView(frame: keyWindow.bounds)
      fatherView.backgroundColor = UIColor.clear
      keyWindow.addSubview(fatherView)
      
      fatherView.addSubview(maskAnimationView)
      maskAnimationView.frame = keyWindow.bounds
      maskAnimationView.backgroundColor = UIColor.black
      maskAnimationView.alpha = 0
      
      let tap = UITapGestureRecognizer(target: self, action: maskAnimationViewTap)
      maskAnimationView.isUserInteractionEnabled = true
      maskAnimationView.addGestureRecognizer(tap)
      
      switch fromDirection {
      case .Right:
        self.frame = CGRect(origin: CGPoint(x:keyWindow.bounds.width,y:self.frame.origin.y), size: CGSize(width:self.frame.width,height:self.frame.height))
      case .Bottom:
        self.frame = CGRect(origin: CGPoint(x:self.frame.origin.x,y:keyWindow.bounds.height), size: CGSize(width:self.frame.width,height:self.frame.height))
      default:
        break
      }
      fatherView.addSubview(self)
      
      UIView.animate(withDuration: 0.3, animations: {
        self.maskAnimationView.alpha = 0.5
        switch self.fromDirection {
        case .Right:
          self.frame = CGRect(origin: CGPoint(x:keyWindow.bounds.width - self.frame.width,y:self.frame.origin.y), size: CGSize(width:self.frame.width,height:self.frame.height))
        case .Bottom:
          self.frame = CGRect(origin: CGPoint(x:self.frame.origin.x,y:keyWindow.bounds.height-self.frame.height), size: CGSize(width:self.frame.width,height:self.frame.height))
        default:
          break
        }
        
      }, completion: nil)
    }
  }
  
  public func dismissView(_ completeAction:(()->())?) {
    UIView.animate(withDuration: 0.3, animations: {
      self.maskAnimationView.alpha = 0
      switch self.fromDirection {
      case .Right:
        self.frame = CGRect(origin: CGPoint(x:self.maskAnimationView.bounds.width,y:self.frame.origin.y), size: CGSize(width:self.frame.width,height:self.frame.height))
      case .Bottom:
        self.frame = CGRect(origin: CGPoint(x:self.frame.origin.x,y:self.maskAnimationView.bounds.height), size: CGSize(width:self.frame.width,height:self.frame.height))
      default:
        break
      }
    }, completion: { (complete) in
      self.superview?.removeFromSuperview()
      if completeAction != nil {completeAction!()}
    })
  }
  
}

//MARK: - 绘制渐变view
public protocol DrawGradientView {
  func drawGradientUse(top:UIColor,bottom:UIColor,rect:CGRect)
}

extension DrawGradientView where Self:UIView {
  
  public func drawGradientUse(top:UIColor,bottom:UIColor,rect:CGRect) {
    //将颜色和颜色的位置定义在数组内
    let gradientColors: [CGColor] = [top.cgColor, bottom.cgColor]
    let gradientLocations: [CGFloat] = [0.0, 1.0]
    //创建CAGradientLayer实例并设置参数
    let gradientLayer: CAGradientLayer = CAGradientLayer()
    gradientLayer.colors = gradientColors
    gradientLayer.locations = gradientLocations as [NSNumber]?
    gradientLayer.frame = rect
    self.layer.insertSublayer(gradientLayer, at: 0)
  }
}






