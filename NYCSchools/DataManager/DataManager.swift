//
//  DataManager.swift
//  NYCSchools
//
//  Created by Jean Cabral on 4/23/19.
//  Copyright © 2019 Jean Cabral. All rights reserved.
//

import Foundation
// https://data.cityofnewyork.us/resource/s3k6-pzi2.json --> Schools API EndPoint
// https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4 --> SAT API Endpoint
class DataManager{
    
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
    
    
    //Retrieves data from the
    func downloadSchoolJSON(dataToRetrieve: API){
        guard var getURL = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else { print("Error getting SchoolURL")
            return
        }
        
        var httpTask = URLSession.shared.dataTask(with: getURL){ (data,response, error) in
            
            guard let validData = data, error == nil else{
                DispatchQueue.main.async {
                    print("Error getting data from ")
                }
                return
            }
            
        }
        
    }
    
    func downloadSATJSON(){
        var getURL = URL(string: "https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4")
    }

}
