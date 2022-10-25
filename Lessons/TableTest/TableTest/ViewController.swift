//
//  ViewController.swift
//  TableTest
//
//  Created by Владимир Амелькин on 13.10.2022.
//

import UIKit

class ViewController: UIViewController {

    var testTableView = UITableView()
    var identifier = "MyCell"
    var dataArray = ["Swift", "Java", "C++", "C#", "JavaScript"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testTableView = UITableView(frame: view.bounds, style: .plain)
        testTableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        testTableView.delegate = self
        testTableView.dataSource = self
        view.addSubview(testTableView)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
        detailViewController.language = dataArray[indexPath.row]
        present(detailViewController, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? DetailTableViewCell
        cell?.setLanguage(language: dataArray[indexPath.row])
        return cell ?? DetailTableViewCell()
    }
}

