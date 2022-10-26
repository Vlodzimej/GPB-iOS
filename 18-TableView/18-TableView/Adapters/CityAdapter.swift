//
//  TableViewAdapter.swift
//  18-TableView
//
//  Created by Владимир Амелькин on 26.10.2022.
//

import UIKit
import CoreLocation

protocol CityAdapterDelegate {
    func showDetails(of city: City)
}

class CityAdapter: NSObject {
    
    private lazy var cities: [City] = {
        [
            City(name: "Moscow", image: UIImage(named: "moscow")!, location: CLLocation(latitude: 55.751244, longitude: 37.618423)),
            City(name: "Rostov on Don", image: UIImage(named: "rostov")!, location: CLLocation(latitude: 47.233334, longitude: 39.700001)),
            City(name: "Kazan", image: UIImage(named: "kazan")!, location: CLLocation(latitude: 55.796391, longitude: 49.108891))
        ]
    }()
    
    var delegate: CityAdapterDelegate?
    
    func setup(for tableView: UITableView) {
        tableView.register(CityCell.self, forCellReuseIdentifier: "CityCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CityAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = cities[indexPath.item]
        delegate?.showDetails(of: city)
    }
}

extension CityAdapter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityCell else { return UITableViewCell() }
        let city = cities[indexPath.item]
        cell.configurate(name: city.name, image: city.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CityCell.UIConstants.cellHeight
    }
}
