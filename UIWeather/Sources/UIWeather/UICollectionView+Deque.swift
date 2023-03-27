//
//  UICollectionView+Deque.swift
//  
//
//  Created by ziad on 24/03/2023.
//

import UIKit

extension UICollectionView {
    
    public func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T else {
            fatalError("DequeueReusableCell failed while casting")
        }
        return cell
    }
    
    public func register<T: UICollectionViewCell>(cell: T.Type) {
        register(cell.nib, forCellWithReuseIdentifier: cell.className)
    }
}

extension UICollectionView {
    
    class var cellId: String {
        return "\(self)"
    }
}
