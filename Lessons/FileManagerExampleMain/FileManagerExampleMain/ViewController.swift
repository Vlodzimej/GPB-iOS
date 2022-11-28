//
//  ViewController.swift
//  FileManagerExampleMain
//
//  Created by Владимир Амелькин on 23.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bundleTest()
    }

    func bundleTest() {
        let url = Bundle.main.url(forResource: "download", withExtension: "jpeg")
        let fileData: Data = try! Data(contentsOf: url!)
        let image = UIImage(data: fileData)
        viewImage.image = image
    }

    func fileManagerTest() {
        let fileManager = FileManager.default
        let docsDirs = try? fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        var documentsDir = docsDirs?.first!
        
        documentsDir!.append(path: "Login.txt")
        
        do {
            let testString = "Username: Nikolay"
            let testData = testString.data(using: .utf8)!
            try testData.write(to: documentsDir!)
        } catch {
            print("Error: \(error)")
        }
    }
    
    func fileDelegateExample() {
        
    }
}

