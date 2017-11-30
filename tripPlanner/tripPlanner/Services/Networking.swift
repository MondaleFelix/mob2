//
//  Networking.swift
//  tripPlanner
//
//  Created by Mac on 12/7/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case put =  "PUT"
    case delete = "DELETE"
    case patch = "PATCH"
    case post =  "POST"
}

class Networking {

    static let baseURL = URL(string: "http://127.0.0.1:5000")!
    static let session = URLSession.shared
    
//
//    func request(completion: @escaping (([Trip]) -> Void))  {
//        // Full URL
////        let fullURL = baseURL.appendingPathComponent("trips")
//        // URLRequest
//        var urlRequest = URLRequest(url: fullURL!)
//        // Headers
//        urlRequest.allHTTPHeaderFields = ["Authorization": "Basic ZGFsZTpkYWxl"]
//        // HTTP Method
//        urlRequest.httpMethod = HTTPMethod.get.rawValue
//        
//        // Body
//        urlRequest.httpBody = nil
//
//        // URL Parameters - TODO
//
//        // Setup URLSession
//        session.dataTask(with: urlRequest) { (data, response, error) in
//            guard let safeData = data else {return}
//
//            /// Decode data
//            let decoder = JSONDecoder()
//            guard let trips = try? decoder.decode([Trip].self, from: safeData) else {return}
//
//            completion(trips)
//
//        }.resume()
//
//
//    }
    
    static func getTrips(user: User,  completion: @escaping ([Trip]) -> Void){
        let fullURL = baseURL.appendingPathComponent("trips")
        var request = URLRequest(url: fullURL)


        request.httpMethod = "GET"
        request.addValue(user.authHeader , forHTTPHeaderField: "Authorization")
        let task = session.dataTask(with: request) { (data, response, error) in
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(json)
                let decoder = JSONDecoder()
                let trips = try! decoder.decode([Trip].self, from: data)
                completion(trips)
            }
        }.resume()
    }
    
    static func getUser(user: User, completion: @escaping (Int) -> Void ){
        let fullURL = baseURL.appendingPathComponent("users")
        var request = URLRequest(url: fullURL)
        
        
        request.httpMethod = "GET"
        request.addValue(user.authHeader , forHTTPHeaderField: "Authorization")
        let task = session.dataTask(with: request) { (data, response, error) in
            if let response = response as? HTTPURLResponse{
                completion(response.statusCode)
            
                
            }
            }.resume()
    }
}
