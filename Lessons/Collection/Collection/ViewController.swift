//
//  ViewController.swift
//  Collection
//
//  Created by Владимир Амелькин on 24.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let adapter = NumberAdapter()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        adapter.setup(for: collectionView)
        collectionView.reloadData()
    }
}



