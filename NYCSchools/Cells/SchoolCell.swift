//
//  SchoolCell.swift
//  NYCSchools
//
//  Created by Jean Cabral on 4/23/19.
//  Copyright © 2019 Jean Cabral. All rights reserved.
//

import UIKit


class SchoolCell: UITableViewCell {

    
    @IBOutlet weak var SchoolName: UILabel!
    
    func displayScool(school: School){
        SchoolName.text = school.name
    }
    
    
    
    
    
    
    
}
