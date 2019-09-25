//
//  View.swift
//
//  Created by Nowfal E Salam on 21/09/19.
//  Copyright © 2019 Nowfal E Salam. All rights reserved.
//

import Foundation
import UIKit

class GradientView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor?  {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    public let buttongradient: CAGradientLayer = CAGradientLayer()
    
    func updateGradientColors(colors:[UIColor] = [UIColor.white,#colorLiteral(red: 0.3137254902, green: 0.8901960784, blue: 0.7607843137, alpha: 1).withAlphaComponent(0.28
        )]) {
        buttongradient.colors = colors.map { $0.cgColor }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.updateGradient()
    }
    
    func setupGradient() {
        buttongradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        buttongradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        self.layer.insertSublayer(buttongradient, at: 0)
        
        updateGradientColors()
    }
    
    func updateGradient() {
        buttongradient.frame = self.bounds
        //buttongradient.cornerRadius = buttongradient.frame.height / 2
    }
}
