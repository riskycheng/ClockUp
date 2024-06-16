//
//  UnevenRoundedRectangle.swift
//  ClockUp
//
//  Created by Jian Cheng on 2024/6/15.
//

import UIKit

@IBDesignable
class UnevenRoundedRectangle: UIView {
    
    @IBInspectable var topLeftRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable var topRightRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable var bottomLeftRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    @IBInspectable var bottomRightRadius: CGFloat = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    private var path: UIBezierPath?

    override func layoutSubviews() {
        super.layoutSubviews()
        updatePath()
    }

    private func updatePath() {
        let path = UIBezierPath()
        
        // Start from top-left corner
        path.move(to: CGPoint(x: bounds.minX + topLeftRadius, y: bounds.minY))
        
        // Top side
        path.addLine(to: CGPoint(x: bounds.maxX - topRightRadius, y: bounds.minY))
        path.addArc(withCenter: CGPoint(x: bounds.maxX - topRightRadius, y: bounds.minY + topRightRadius), radius: topRightRadius, startAngle: CGFloat(3 * Double.pi / 2), endAngle: 0, clockwise: true)
        
        // Right side
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY - bottomRightRadius))
        path.addArc(withCenter: CGPoint(x: bounds.maxX - bottomRightRadius, y: bounds.maxY - bottomRightRadius), radius: bottomRightRadius, startAngle: 0, endAngle: CGFloat(Double.pi / 2), clockwise: true)
        
        // Bottom side
        path.addLine(to: CGPoint(x: bounds.minX + bottomLeftRadius, y: bounds.maxY))
        path.addArc(withCenter: CGPoint(x: bounds.minX + bottomLeftRadius, y: bounds.maxY - bottomLeftRadius), radius: bottomLeftRadius, startAngle: CGFloat(Double.pi / 2), endAngle: CGFloat(Double.pi), clockwise: true)
        
        // Left side
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.minY + topLeftRadius))
        path.addArc(withCenter: CGPoint(x: bounds.minX + topLeftRadius, y: bounds.minY + topLeftRadius), radius: topLeftRadius, startAngle: CGFloat(Double.pi), endAngle: CGFloat(3 * Double.pi / 2), clockwise: true)
        
        path.close()
        
        self.path = path
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
