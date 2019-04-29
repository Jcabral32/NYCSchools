//
//  School.swift
//  NYCSchools
//
//  Created by Jean Cabral on 4/24/19.
//  Copyright © 2019 Jean Cabral. All rights reserved.
//

import Foundation

class School: Decodable{
    
    let name: String
    let address: String
    
    
    
    init(name:String, address: String){
        self.name = name
        self.address = address
    }
    
}

struct SchoolJSONModel: Codable {
    
    var schools: [[String:String]]
    
    
}
