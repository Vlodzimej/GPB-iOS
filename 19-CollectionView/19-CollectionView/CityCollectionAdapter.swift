//
//  ImageCollectionAdapter.swift
//  19-CollectionView
//
//  Created by Владимир Амелькин on 02.11.2022.
//

import UIKit

protocol CityCollectionAdapterDelegate {
    func showAlert(data: String)
}

class CityCollectionAdapter: NSObject {
    
    var delegate: CityCollectionAdapterDelegate?
    
    private let cities: [City] = Data.getData()

    func setup(for collectionView: UICollectionView){
        collectionView.register(CityCell.self, forCellWithReuseIdentifier: CityCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CityCollectionAdapter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.item
        let city = cities[index]
        delegate?.showAlert(data: city.name)
    }
}

extension CityCollectionAdapter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCell.identifier, for: indexPath) as? CityCell else { return UICollectionViewCell() }
        let city = cities[indexPath.item]
        cell.configurate(image: city.image, text: city.name)
        return cell
    }
}
