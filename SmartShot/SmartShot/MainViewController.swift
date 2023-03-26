//
//  ViewController.swift
//  SmartShot
//
//  Created by Jagadeesh on 18/10/22.
//

import UIKit
import AVKit
import AVFoundation

class MainViewController: UIViewController {
    @IBOutlet weak var editorView: UIView!
    @IBOutlet weak var cameraView: UIView!
    @IBOutlet weak var studioView: UIView!
    @IBOutlet weak var trimView: UIView!
    @IBOutlet weak var filtersView: UIView!
    @IBOutlet weak var cutView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editorView.layer.cornerRadius = 30
        cameraView.layer.cornerRadius = 30
        studioView.layer.cornerRadius = 30
        trimView.layer.cornerRadius = 30
        filtersView.layer.cornerRadius = 30
        cutView.layer.cornerRadius = 30
        createFolderInDirectory()
    }
    
    fileprivate func createFolderInDirectory() {
        if let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
            let docURL = URL(string: documentsPath)!
            let dataPath = docURL.appendingPathComponent("Vedios")
            if !FileManager.default.fileExists(atPath: dataPath.path) {
                do {
                    try FileManager.default.createDirectory(atPath: dataPath.path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }

    @IBAction func tapOnEditorButton(_ sender: Any) {
        
    }
  
    @IBAction func tapOnCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.mediaTypes = ["public.movie"]
        picker.videoMaximumDuration = 11
        picker.videoQuality = UIImagePickerController.QualityType.typeHigh
        picker.cameraFlashMode = .off
        picker.cameraCaptureMode = .video
        picker.delegate = self
        present(picker, animated: false)
    }
}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: false)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let VC = storyboard.instantiateViewController(withIdentifier: "CameraViewController") as! CameraViewController
        navigationController?.pushViewController(VC, animated: false)
        guard let url = info[.mediaURL] as? URL else { return }
        if let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
            let docURL = URL(fileURLWithPath: documentsPath)
            let dataPath = docURL.appendingPathComponent("Vedios")
            let dataPath2 = dataPath.appendingPathComponent("2.mov")
            
            do {
                try FileManager.default.moveItem(at: url, to: dataPath2)
            } catch {
                print(error.localizedDescription)
            }
            
            
        }
        let video = AVPlayer(url: url)
            let videoPlayer = AVPlayerViewController()
            videoPlayer.player = video
            present(videoPlayer, animated: true) {
                video.play()
        }
   }
    
    
}



