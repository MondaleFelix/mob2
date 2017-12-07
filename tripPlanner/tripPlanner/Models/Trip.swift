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

}


