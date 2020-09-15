//
//  SecondViewController.swift
//  iOS_ProjectC
//
//  Created by 김태훈 on 2020/09/12.
//  Copyright © 2020 thoonk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "cityCell"
    
    var textSetKorean: String?
    var textSetAsset: String?
    
    var cities: [City] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = textSetKorean

        let jsonDecoder: JSONDecoder = JSONDecoder()
        guard let dataAsset: NSDataAsset = NSDataAsset(name: textSetAsset!) else{
            return
        }
        do{
            self.cities = try jsonDecoder.decode([City].self, from: dataAsset.data)
        }catch{
            print(error)
        }
        
        self.tableView.reloadData()
    }
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //tableView.estimatedRowHeight = 60
        //tableView.rowHeight = UITableView.automaticDimension
        
        let cell : CityTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! CityTableViewCell
        
        let city: City = self.cities[indexPath.row]
        
        let fahrenheit: Double = floor((city.celsius * 1.8 + 32) * 100) / 100
    
//        state
//        10 : sunny
//        11 : cloudy
//        12 : rainy
//        13 : snowy
        
        switch city.state{
        case 10:
            cell.leftImageView.image = UIImage(named: "sunny")
        case 11:
            cell.leftImageView.image = UIImage(named: "cloudy")
        case 12:
            cell.leftImageView.image = UIImage(named: "rainy")
        case 13:
            cell.leftImageView.image = UIImage(named: "snowy")
        default:
            print("ImageError")
        }
        
        cell.cityLabel.text = city.cityName
        cell.temperatureLabel.text = "섭씨 \(city.celsius)도 / 화씨 \(fahrenheit)도"
        cell.rainfallLabel.text = "강수확률 \(city.rainfallProbability)%"
        
        return cell
    }

   
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextController: ThirdViewController = segue.destination as? ThirdViewController else{
            return
        }
        
        
        if segue.identifier == "showInfo"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let city: City = self.cities[indexPath.row]
                nextController.textSetCity = city.cityName
                nextController.textSetState = city.state
                nextController.textSetTemperature = city.celsius
                nextController.textSetRainfall = city.rainfallProbability
            }
        }
    }
    
}
