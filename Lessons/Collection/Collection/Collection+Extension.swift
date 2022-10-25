//
//  Collection+Extension.swift
//  Collection
//
//  Created by Владимир Амелькин on 24.10.2022.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(for classType: T.Type) {
        let nib = UINib(nibName: classType, bundle: Bundle.main)
        register(nib, forCellWithReuseIdentifier: classType)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell> (for classType: T.Type, from indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: "\(classType)", for: indexPath) as! T
    }
    
}

