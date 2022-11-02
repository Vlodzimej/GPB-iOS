//
//  ImageCell.swift
//  19-CollectionView
//
//  Created by Владимир Амелькин on 02.11.2022.
//

import UIKit

class CityCell: UICollectionViewCell {
    
    struct UIConstants {
        static let cellWidth: CGFloat = 100
        static let cellHeight: CGFloat = 130
        static let imageWidth: CGFloat = 100
        static let imageHeight: CGFloat = 100
    }
    
    static let identifier = "CityCell"
    
    private let imageView = UIImageView()
    private let textLabel = UILabel()
    
    func configurate(image: UIImage, text: String) {
        imageView.image = image
        imageView.frame = CGRect(x: 0, y: 0, width: UIConstants.imageWidth, height: UIConstants.imageHeight)
        addSubview(imageView)
        
        textLabel.text = text
        textLabel.frame = CGRect(x: 0, y: 110, width: UIConstants.cellWidth, height: 20)
        addSubview(textLabel)
    }
}
