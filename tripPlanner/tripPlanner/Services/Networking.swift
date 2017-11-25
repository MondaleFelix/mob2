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
    let baseURL = URL(string: "http://localhost:5000")!
    let session = URLSession.shared
    
    
    func request(completion: @escaping (([Trip]) -> Void))  {
        // Full URL
        let fullURL = baseURL.appendingPathComponent("trips")
        
        // URLRequest
        var urlRequest = URLRequest(url: fullURL)
        // Headers
        urlRequest.allHTTPHeaderFields = ["Authorization": "Basic ZGFsZTpkYWxl"]
        // HTTP Method
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        
        // Body
        urlRequest.httpBody = nil
        
        // URL Parameters - TODO
        
        // Setup URLSession
        session.dataTask(with: urlRequest) { (data, response, error) in
            guard let safeData = data else {return}
            
            /// Decode data
            let decoder = JSONDecoder()
            guard let trips = try? decoder.decode([Trip].self, from: safeData) else {return}
            
            completion(trips)
    
        }.resume()
        
        
    }
}
