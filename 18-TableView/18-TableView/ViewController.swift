//
//  ViewController.swift
//  18-TableView
//
//  Created by Владимир Амелькин on 26.10.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cityAdapter = CityAdapter()
    
    private var currentCity: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    private func initialize() {
        cityAdapter.setup(for: tableView)
        cityAdapter.delegate = self
        
        tableView.separatorStyle = .none
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier, id == "ShowDetailsSegue" {
            if let vc = segue.destination as? DetailViewController {
                vc.city = currentCity
            }
        }
    }
}

extension ViewController: CityAdapterDelegate {
    func showDetails(of city: City) {
        currentCity = city
        self.performSegue(withIdentifier: "ShowDetailsSegue", sender: nil)
    }

}
