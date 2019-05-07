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
    var satArray = [SATScore]()
    var searchResults = [School]()
    let dispatchGroup = DispatchGroup()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        print("STEP 1")
        dataManager.downloadSchoolJSON { (school) in
            self.schoolArray = school
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print("Step 3")
            }
        }
        
        
        dataManager.downloadSATJSON { (scores) in
            self.satArray = scores
        }
        
        print("STEP 2")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchResults.count
        } else {
            return schoolArray.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let schoolCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SchoolCell
        
        if searching{
            let school = searchResults[indexPath.row]
            schoolCell.displayScool(school: school)
            schoolCell.textLabel?.text = school.name
        }else{
            let school = schoolArray[indexPath.row]
            schoolCell.displayScool(school: school)
            schoolCell.textLabel?.text = school.name
        }
        
        return schoolCell
    }

}

extension SchoolViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        searchResults = schoolArray.filter({ (school) -> Bool in
            if school.name.prefix(searchText.count) == searchText{
                return true
            }else{
                return false
            }
        })
        searching = true
        self.tableView.reloadData()
    }
    
    
}

