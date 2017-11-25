//
//  Trip.swift
//  tripPlanner
//
//  Created by Mac on 12/6/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

// Model the properties we want back from the JSON DATA

struct Trip: Codable {

    var _id: String
    var destination: String
    var waypoints: [String]
    var isCompleted: Bool
    var userId: String
    
//    Maps the keys to the ones in JSON
    enum CodingKeys: String, CodingKey {
        case _id
        case destination
        case waypoints
        case isCompleted = "is_completed"
        case userId = "user_id"
        
    }
}