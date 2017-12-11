//
//  WaypointViewController.swift
//  tripPlanner
//
//  Created by Mac on 12/12/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class WaypointViewController: UIViewController{
    var trip : Trip!
    @IBOutlet weak var tableView: UITableView!
}

extension WaypointViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trip.waypoints.count
    }
    

}
