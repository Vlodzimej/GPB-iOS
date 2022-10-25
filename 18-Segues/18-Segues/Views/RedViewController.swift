//
//  RedViewController.swift
//  18-Segues
//
//  Created by Владимир Амелькин on 18.10.2022.
//

import UIKit

class RedViewController: UIViewController {
    
    var number: UInt8?
    
    @IBOutlet weak var numberLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Red controller did load")
        guard let number = number else { return }
        numberLabel.text = "\(number)"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Red controller will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Red controller will dissapear")
    }
    
    @IBAction func onNextButtonTapped(_ sender: UIButton) {
        if let viewController = BlueViewController.initFromSb() {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func onBackButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "unwindToYellow", sender: self)
    }

}
