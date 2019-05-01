//
//  School.swift
//  NYCSchools
//
//  Created by Jean Cabral on 4/24/19.
//  Copyright © 2019 Jean Cabral. All rights reserved.
//

import Foundation

class School{
    
    struct SATScore {
        let readingScore : Int
        let mathScore: Int
        let writingScore: Int
        var avgScore : Int {
          return ((readingScore + mathScore + writingScore) / 3)
        }
        
        init(readingScore: Int, mathScore: Int, writingScore: Int){
            self.readingScore = readingScore
            self.mathScore = mathScore
            self.writingScore = writingScore
        }
        
        
    }
    
    let name: String
    let address: String
    let dbn: String
   // let satScore: SATScore
    
    
    
    init(name:String, address: String, dbn: String){
        self.name = name
        self.address = address
        self.dbn = dbn
    }
    
}
