//
//  BlackViewController.swift
//  18-Segues
//
//  Created by Владимир Амелькин on 25.10.2022.
//

import UIKit

class BlackViewController: UIViewController {

    var number: UInt8 = 0

    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        numberLabel.text = String(number)
        super.viewDidAppear(animated)
    }
    
    @IBAction func goToBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
