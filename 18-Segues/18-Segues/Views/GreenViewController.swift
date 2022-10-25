//
//  GreenViewController.swift
//  18-Segues
//
//  Created by Владимир Амелькин on 18.10.2022.
//

import UIKit

class GreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Green controller did load")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Green controller will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Green controller will dissapear")
    }
    
    
    @IBAction func goToNext(_ sender: Any) {
        if let vc = WhiteViewController.initFromSb() {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
