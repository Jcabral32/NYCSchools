//
//  ViewController.swift
//  NYCSchools
//
//  Created by Jean Cabral on 4/23/19.
//  Copyright © 2019 Jean Cabral. All rights reserved.
//

import UIKit

class SchoolViewController: UITableViewController {

    let dataManager = DataManager()
    let schoolArray = [School]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.downloadSchoolJSON()
        
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolArray.count
    }
    
    


}


