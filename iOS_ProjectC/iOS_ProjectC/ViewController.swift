//
//  ViewController.swift
//  iOS_ProjectC
//
//  Created by 김태훈 on 2020/09/12.
//  Copyright © 2020 thoonk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cell"
    
    var countries: [Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else{
            return
        }
        do{
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        }catch{
            print(error.localizedDescription)
        }
        
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CountryTableViewCell
        
        let country: Country = self.countries[indexPath.row]
        
        cell.leftImageView.image = UIImage(named: "flag_\(country.assetName)")
        
        cell.rightLabel?.text = country.koreanName
        return cell
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        guard let nextController: SecondViewController = segue.destination as? SecondViewController else{
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else{
            return
        }
        
        if let indexPath = tableView.indexPathForSelectedRow{
            let country: Country = self.countries[indexPath.row]
            nextController.textToSet = country.assetName
        }
        
    }
    

}

