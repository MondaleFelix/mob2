//
//  Trip.swift
//  tripPlanner
//
//  Created by Mac on 12/6/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

// Model the properties we want back from the JSON DATA

class Trip: Decodable {

    var _id: String
    var destination: String
    var waypoints: [String]
    var isCompleted: Bool
    var userId: String
    
    init(_id: String, destination: String, waypoints: [String], isCompleted : Bool, userId: String) {
        self._id = _id
        self.destination = destination
        self.waypoints = waypoints
        self.isCompleted = isCompleted
        self.userId = userId
    }
    
//    Maps the keys to the ones in JSON
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case destination
        case waypoints
        case isCompleted = "is_completed"
        case userId = "user_id"

    }

    required convenience init(from decoder : Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let destination = try container.decode(String.self, forKey: .destination)
        let isCompleted = try container.decode(Bool.self, forKey: .isCompleted)
        let userId = try container.decode(String.self, forKey: .userId)
        let waypoints = try container.decodeIfPresent([String].self, forKey: .waypoints)

        self.init(_id: id, destination: destination, waypoints: waypoints!, isCompleted: isCompleted, userId: userId)
    }
}


