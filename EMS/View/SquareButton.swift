//
//  SquareButton.swift
//  EMS
//
//  Created by Kevin C on 1/8/18.
//  Copyright © 2018 KevinC. All rights reserved.
//

import UIKit

@IBDesignable
class SquareButton: UIButton {
        
    @IBInspectable var icon:UIImage? {
            didSet{
                setupView()
            }
        }
    
        override func prepareForInterfaceBuilder() {
            setupView()
        }
        
        func setupView() {
            
            self.setImage(icon, for: .normal)           
            
            layer.cornerRadius = 7.0
            layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
            layer.shadowOpacity = 1.0
            layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
            layer.shadowRadius = 7
        }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 6, options: UIViewAnimationOptions.allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: nil)
        
        super.touchesBegan(touches, with: event)
    }
    
 
    
    
}
