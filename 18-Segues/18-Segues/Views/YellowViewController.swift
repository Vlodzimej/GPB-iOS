//
//  YellowViewController.swift
//  18-Segues
//
//  Created by Владимир Амелькин on 18.10.2022.
//

import UIKit

class YellowViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Yellow controller did load")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Yellow controller will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("Yellow controller will dissapear")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "ToRed" {
            if let vc = segue.destination as? RedViewController {
                vc.number = UInt8.random(in: (0...255))
            }
        }
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
}
