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
    @IBOutlet weak var TripsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Networking().request(completion: handleReponse)
        
    }
    
    func handleReponse(trips: [Trip]) -> Void {
        DispatchQueue.main.async {
            
            
            // Set datasource
            // Reload table view
        }
    }
}
