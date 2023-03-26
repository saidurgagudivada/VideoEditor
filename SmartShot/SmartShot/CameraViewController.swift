//
//  CameraViewController.swift
//  SmartShot
//
//  Created by Jagadeesh on 20/10/22.
//

import UIKit
import AVKit
import AVFoundation

class CameraViewController: UIViewController {
   
        override func viewDidLoad() {
           super.viewDidLoad()
            navigationController?.navigationBar.isHidden = false
        }
     
    @IBAction func tapOnBackButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: false)
    }
     
    
}




