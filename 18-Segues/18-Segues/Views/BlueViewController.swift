//
//  BlueViewController.swift
//  18-Segues
//
//  Created by Владимир Амелькин on 18.10.2022.
//

import UIKit

class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Blue controller did load")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Blue controller will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Blue controller will dissapear")
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GoToStart", sender: self)
    }
    
}
