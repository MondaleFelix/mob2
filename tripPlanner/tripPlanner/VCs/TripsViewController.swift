//
//  TripsViewController.swift
//  tripPlanner
//
//  Created by Mac on 12/7/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class TripsViewController : UIViewController{
    var user : User!   
    
    @IBOutlet weak var TripsTableView: UITableView!
    
    var trips : [Trip] = []{
        didSet{
            reloadTable()
        }
    }
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.TripsTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Networking().request(completion: handleReponse)
        Networking.getTrips(user: user!) { (returnedTrips) in

            self.trips = returnedTrips
            self.reloadTable()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc : WaypointViewController = segue.destination as! WaypointViewController
        vc.trip = trips[(TripsTableView.indexPathForSelectedRow?.row)!]
    }
    func handleReponse(trips: [Trip]) -> Void {
        DispatchQueue.main.async {
            
            
            // Set datasource
            // Reload table view
        }
    }
}

extension TripsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TripView = tableView.dequeueReusableCell(withIdentifier: "TripCell" ) as! TripView
        let trip = trips[indexPath.row]
        cell.tripLabel.text = trip.destination
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
}

extension TripsViewController: UITableViewDelegate {
    
}

