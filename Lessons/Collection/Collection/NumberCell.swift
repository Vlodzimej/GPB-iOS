//
//  NumberCell.swift
//  Collection
//
//  Created by Владимир Амелькин on 24.10.2022.
//

import UIKit

class NumberCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.borderColor = UIColor.black.cgColor
        self.contentView.layer.borderWidth = 1
    }
    
    func update(from number: Int) {
        numberLabel.text = "\(number)"
    }
    
}
