//
//  SecondViewController.swift
//  SimpleTable
//
//  Created by 김태훈 on 2020/09/10.
//  Copyright © 2020 thoonk. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var textToSet: String?
    
    @IBOutlet weak var textLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.textLabel.text = self.textToSet
    }
    

    

}
