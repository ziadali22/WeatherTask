//
//  File.swift
//  
//
//  Created by ziad on 23/03/2023.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat{
        get{
            return CGFloat()
        }set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable var borderwidth: CGFloat{
        get{
            return CGFloat()
        }set{
            self.layer.borderWidth = newValue
            self.layer.masksToBounds = true
        }
    }
    @IBInspectable var borderColor: UIColor{
        get{
            return UIColor()
        }set{
            self.layer.borderColor = newValue.cgColor
            self.layer.masksToBounds = true
        }
    }
    
}
