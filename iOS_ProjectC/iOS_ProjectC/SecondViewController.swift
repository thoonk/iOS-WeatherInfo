//
//  SecondViewController.swift
//  iOS_ProjectC
//
//  Created by 김태훈 on 2020/09/12.
//  Copyright © 2020 thoonk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cityCell"

    var textToSet: String?
    var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else{
            return
        }
        do{
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : CityTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CityTableViewCell
        
        let city: City = self.cities[indexPath.row]
        
        let fahrenheit: Double = floor((city.celsius * 1.8 + 32) * 100 / 100)
        
        cell.leftImageView.image = UIImage(named: "flag_\(city)")
        
        
        return cell
    }
    
}
