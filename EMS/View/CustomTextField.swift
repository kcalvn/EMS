//
//  CustomTextField.swift
//  NapChat
//
//  Created by Kevin C on 10/13/17.
//  Copyright © 2017 KevinC. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
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
    
    @IBInspectable var borderColer: UIColor? {
        didSet{
            layer.borderColor = borderColer?.cgColor
        }
    }
    
    @IBInspectable var bgColor: UIColor?{
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            let rawString = attributedPlaceholder?.string != nil ? attributedPlaceholder?.string : ""
            let str = NSAttributedString(string: rawString!, attributes: [NSAttributedStringKey.foregroundColor : placeholderColor!])
            attributedPlaceholder = str
        }
    }
    
}
