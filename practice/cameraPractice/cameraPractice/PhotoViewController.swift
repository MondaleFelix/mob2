//
//  PhotoViewController.swift
//  cameraPractice
//
//  Created by Mac on 11/21/17.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    var takenImage:UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let availableImage = takenImage{
            imageView.image = availableImage
        }
        
        // Do any additional setup after loading the view.
    }


    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
