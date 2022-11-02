//
//  ViewController.swift
//  19-CollectionView
//
//  Created by Владимир Амелькин on 02.11.2022.
//

import UIKit

class ViewController: UIViewController {

    private let adapter = CityCollectionAdapter()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 100, height: 130)
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.delegate = self
        adapter.setup(for: collectionView)
        initialize()
    }
    
    private func initialize() {
        view.addSubview(collectionView)
    }
}

extension ViewController: CityCollectionAdapterDelegate {
    func showAlert(data: String) {
        let alert = UIAlertController(title: "Your choose", message: data, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        
        show(alert, sender: nil)
    }
}
