//
//  CameraViewController.swift
//  SmartShot
//
//  Created by Jagadeesh on 20/10/22.
//

import UIKit

class CameraViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
   
        override func viewDidLoad() {
           super.viewDidLoad()
            navigationController?.navigationBar.isHidden = true
        }
     
    @IBAction func tapOnBackButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: false)
    }
     
    
}




