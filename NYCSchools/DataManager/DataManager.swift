//
//  DataManager.swift
//  NYCSchools
//
//  Created by Jean Cabral on 4/23/19.
//  Copyright © 2019 Jean Cabral. All rights reserved.
//

import Foundation
import SwiftyJSON
// https://data.cityofnewyork.us/resource/s3k6-pzi2.json --> Schools API EndPoint
// https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4 --> SAT API Endpoint

/*
 The DataManager object is responsible for 
 */
class DataManager{
    
    
    
    //Retrieves data from the
    func downloadSchoolJSON(){
            guard let getURL = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else { print("Error getting SchoolURL")
                return
            }
        
            let task = URLSession.shared.dataTask(with: getURL){ (data,response, error) in
                
                var schoolArray = [School]()
                guard let newData = data else{
                    return
                }
                
                do{
                    let json = try JSON(data: newData)
                    
                    //let school = School(name: json[0][""].string!, address: json[0][7].string!)
                    
                    for i in 0...json.count{
                        let schoolName = json[i]["school_name"].description
                        let address = json[i]["primary_address_line_1"].description
                        schoolArray.append(School(name: schoolName , address: address))
                    }
                    print(schoolArray[0].name)
                    
                }catch{
                    print(error)
                }
                
        }
        task.resume()
        }
    
    
    func downloadSATJSON(){
        var getURL = URL(string: "https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4")
    }

}


struct API{
    
    private var urlComponents = URLComponents()
    
    init(scheme:String, host: String, path: String){
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
    }
    
    func getURL()-> URL{
        guard let url = urlComponents.url else{
            fatalError()
        }
        return url
    }
    
    
    
}

