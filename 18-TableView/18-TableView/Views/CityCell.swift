//
//  CityCell.swift
//  18-TableView
//
//  Created by Владимир Амелькин on 26.10.2022.
//

import UIKit

class CityCell: UITableViewCell {
    
    struct UIConstants {
        static let cellHeight: CGFloat = 128
        static let imageSize: CGFloat = 128
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView?.frame = CGRect(x: 0, y: 0, width: UIConstants.imageSize, height: UIConstants.imageSize)
        textLabel?.layoutMargins = .zero
    }
    
    func configurate(name: String, image: UIImage) {
        translatesAutoresizingMaskIntoConstraints = false
        if let imageView = imageView {
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleToFill
            imageView.image = image
            imageView.clipsToBounds = true
            imageView.layer.borderColor = UIColor.gray.cgColor
            imageView.layer.borderWidth = 1
        }
        
        if let textLabel = textLabel {
            textLabel.text = name
            textLabel.textAlignment = .right

        }
    }
}
