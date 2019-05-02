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
// https://data.cityofnewyork.us/resource/f9bf-2cp4.json --> SAT API Endpoint


/*
 The DataManager object is responsible for 
 */
class DataManager{
    
    
    
    func downloadSATJSON(_ completion: @escaping ([SATScore]) -> ()){
        
        
        var satArray = [SATScore]()
        guard let getSATURL = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json") else {
            print("Error getting SATURL")
            fatalError()
        }
        
        let task = URLSession.shared.dataTask(with: getSATURL){ (data,response, error) in
            guard let newData = data else{
                return
            }
            
            do{
                let json = try JSON(data: newData)
                //Iterate over all json objects
                for i in 0...json.count{
                    let readingScore = Int(json[i]["sat_critical_reading_avg_score"].description) ?? 0
                    let mathScore = Int(json[i]["sat_math_avg_score"].description) ?? 0
                    let writingScore = Int(json[i]["sat_writing_avg_score"].description) ?? 0
                    let dbn = json[i]["dbn"].description
                    //DispatchQueue.main.async {
                    satArray.insert(SATScore(readingScore: readingScore, mathScore: mathScore, writingScore: writingScore, dbn: dbn), at: i)
                
                    completion(satArray)
                    
                    print(satArray[0])
                }
            }catch{
                print(error)
            }
        }.resume()
        
        
    }
    
    
    
    //Retrieves data from the
    func downloadSchoolJSON(_ completion: @escaping ([School]) -> ())  {
        
            var schoolArray = [School]()
        
            guard let getSchoolURL = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json") else { print("Error getting SchoolURL")
                fatalError()
            }
        
            let task = URLSession.shared.dataTask(with: getSchoolURL){ (data,response, error) in
                guard let newData = data else{
                    return
                }
    
                do{
                    let json = try JSON(data: newData)
                    //Iterate over all json objects
                    for i in 0...json.count{
                        let schoolName = json[i]["school_name"].description
                        let address = json[i]["primary_address_line_1"].description
                        let dbn = json[i]["dbn"].description
                        //DispatchQueue.main.async {
                        schoolArray.insert(School(name: schoolName , address: address, dbn: dbn), at: i)
                        schoolArray.sort(by: { (school1, school2) -> Bool in
                            if school1.name < school2.name{
                                return true
                            }
                                return false
                        })
                            completion(schoolArray)
                    }
                    //Test
                    print(schoolArray[0].name)
                }catch{
                    print(error)
                }
            }
            task.resume()
        
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

