//
//  User.swift
//  tripPlanner
//
//  Created by Mac on 12/6/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation

class User: Codable {
    let username : String
    let password : String
    let authHeader : String

    init(username:String, password: String) {
        self.username = username
        self.password = password
        let loginString = String(format: "%@:%@", username, password)
        let loginData: Data = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString(options: .init(rawValue: 0))
        self.authHeader = "Basic \(base64LoginString)"
    }
    
    enum UserKeys : String, CodingKey{
        case username
        case password
    }

}



