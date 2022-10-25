//
//  DetailTableViewCell.swift
//  TableTest
//
//  Created by Владимир Амелькин on 13.10.2022.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    let language: String = ""
    let languageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        languageLabel.textColor = .red
        languageLabel.text = language
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(languageLabel)
        languageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        languageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        languageLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        languageLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setLanguage(language: String) {
        languageLabel.text = language
    }
}
