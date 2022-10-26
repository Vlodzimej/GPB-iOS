//
//  DetailViewController.swift
//  18-TableView
//
//  Created by Владимир Амелькин on 26.10.2022.
//

import UIKit

class DetailViewController: UIViewController {


    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var coordsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var city: City?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let city = city {
            cityNameLabel.text = city.name
            coordsLabel.text = "\(city.location.coordinate.latitude) \(city.location.coordinate.longitude)"
            imageView.image = city.image
        }
    }
}
