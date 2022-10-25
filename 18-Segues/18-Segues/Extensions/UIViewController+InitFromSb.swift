//
//  UIViewController+InitFromSb.swift
//  18-Segues
//
//  Created by Владимир Амелькин on 18.10.2022.
//

import UIKit

extension UIViewController {
    static var id: String {
        String(describing: Self.self)
    }
    
    static func initFromSb(_ sb: String = "Main") -> UIViewController? {
        let storyboard = UIStoryboard(name: sb, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: id)
        return vc
    }
}
