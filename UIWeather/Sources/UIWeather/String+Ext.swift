//
//  File.swift
//  
//
//  Created by ziad on 24/03/2023.
//

import UIKit
extension String {

    public func calculateWidthForString() -> CGRect{
        let size = CGSize(width: 200, height: 1000)
        let options  = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: self).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17) ], context: nil)
    }
    
   public func calculateHeightForString() -> CGRect{
        let size = CGSize(width: 200, height: 1000)
        let options  = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: self).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17)], context: nil)
    }
}
