//
//  ViewController.swift
//  tripPlanner
//
//  Created by Mac on 11/26/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var user : User!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc : TripsViewController = segue.destination as! TripsViewController
        vc.user = user
    }
    
    @IBAction func loginButton(_ sender: Any) {
        self.user = User(username: usernameTextField.text!, password: passwordTextField.text!)
        print("username: \(usernameTextField.text!)")
        print("password: \(passwordTextField.text!)")
        Networking.getUser(user: user) { (code) in
            print(code)
        }
    }
}

