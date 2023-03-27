//
//  UITableView+Deque.swift
//  
//
//  Created by ziad on 25/03/2023.
//

import UIKit

extension UITableView {
    
   public func dequeueCell<T: UITableViewCell>() -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.className) as? T else { fatalError("DequeueReusableCell failed while casting") }
        return cell
    }
    
    public func register<T: UITableViewCell>(cell: T.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.className)
    }
}

extension UITableViewCell {
    
    class var cellId: String {
        return "\(self)"
    }
}
