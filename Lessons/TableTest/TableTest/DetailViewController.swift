//
//  DetailViewController.swift
//  TableTest
//
//  Created by Владимир Амелькин on 13.10.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var language: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        let languageLabel = UILabel()
        languageLabel.text = language
        languageLabel.textColor = .red
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        view?.addSubview(languageLabel)
        languageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        languageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        languageLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        languageLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
}
