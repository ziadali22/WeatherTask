//
//  IdentifiableView.swift
//  
//
//  Created by ziad on 24/03/2023.
//

import UIKit

extension UIView {
    
    public static var nib: UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
}

extension NSObject {
    
    public class var className: String {
        return "\(self)"
    }
}
