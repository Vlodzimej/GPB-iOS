//
//  WhiteViewController.swift
//  18-Segues
//
//  Created by Владимир Амелькин on 25.10.2022.
//

import UIKit

class WhiteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToNext(_ sender: Any) {
        if let vc = BlackViewController.initFromSb() as? BlackViewController {
            vc.number = UInt8.random(in: (0...255))
            self.present(UINavigationController(rootViewController: vc), animated: true)
        }
    }
}
