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
    var schoolArray = [School]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.downloadSchoolJSON { (school) in
            self.schoolArray = school
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //self.schoolArray = self.dataManager.downloadSchoolJSON()
        let school = schoolArray[indexPath.row]
        let schoolCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SchoolCell
        
        schoolCell.displayScool(school: school)
        schoolCell.textLabel?.text = school.name
        //tableView.reloadData()
        return schoolCell
    }
    
    
    
    


}


