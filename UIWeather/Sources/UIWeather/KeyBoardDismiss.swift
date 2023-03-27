//
//  File.swift
//  
//
//  Created by ziad on 24/03/2023.
//

import UIKit

extension UIViewController {
    public func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view?.addGestureRecognizer(tap)
    }
}
