//
//  Button.swift
//  MaskDemoProject
//
//  Created by Елизавета Щербакова on 23.03.2020.
//  Copyright © 2020 Sсherbakova Elizaveta Nikolaevna. All rights reserved.
//

import UIKit
@IBDesignable
class Button: UIButton {
    
    var path: UIBezierPath?
    private var cornerRadii = CGSize()
    @IBInspectable var cornerRadiiSize: CGFloat = 0 {
        didSet {
            cornerRadii = CGSize(width: cornerRadiiSize, height: cornerRadiiSize)
        }
    }
    @IBInspectable var color: UIColor = .green
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: cornerRadii)
        
        color.setFill()
        path?.fill()
    }
    
    
    // образка кнопки
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let path = path {
            return path.contains(point)
        }
        return false
    }
}
