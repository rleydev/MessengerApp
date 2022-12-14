//
//  GradientView.swift
//  MessengerApp
//
//  Created by Arthur Lee on 10.08.2022.
//

import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setUpGradientColors(startColor: startColor, endColor: endColor)
        }
    }
    
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setUpGradientColors(startColor: startColor, endColor: endColor)
        }
    }
    
    enum Point {
        case topLeading
        case leading
        case bottomLeading
        case top
        case center
        case bottom
        case topTrailing
        case trailing
        case bottomTrailing

        var point: CGPoint {
            switch self {
            case .topLeading:
                return CGPoint(x: 0, y: 0)
            case .leading:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeading:
                return CGPoint(x: 0, y: 1.0)
            case .top:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottom:
                return CGPoint(x: 0.5, y: 1.0)
            case .topTrailing:
                return CGPoint(x: 1.0, y: 0.0)
            case .trailing:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomTrailing:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    
    init(from: Point, to: Point, startColor: UIColor?, endColor: UIColor?) {
        self.init()
        setUpGradient(from: from, to: to, startColor: startColor, endColor: endColor)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func setUpGradient(from: Point, to: Point, startColor: UIColor?, endColor: UIColor?) {
        self.layer.addSublayer(gradientLayer)
        setUpGradientColors(startColor: startColor, endColor: endColor)
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint = to.point
    }
    
    private func setUpGradientColors(startColor: UIColor?, endColor: UIColor?) {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpGradient(from: .leading, to: .trailing, startColor: startColor, endColor: endColor)
    }
}
