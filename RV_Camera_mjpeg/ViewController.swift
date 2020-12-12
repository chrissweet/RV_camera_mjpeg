//
//  ViewController.swift
//  MJPEGStreamLib_Example
//
//  Created by Kuray ÖĞÜN on 5.12.2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
//import MJPEGStreamLib

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var stream: MJPEGStreamLib!
    var url: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the ImageView to the stream object
        stream = MJPEGStreamLib(imageView: imageView)
        // Start Loading Indicator
        stream.didStartLoading = { [unowned self] in
            self.loadingIndicator.startAnimating()
        }
        // Stop Loading Indicator
        stream.didFinishLoading = { [unowned self] in
            self.loadingIndicator.stopAnimating()
        }
        
        // Your stream url should be here !
        let url = URL(string: "http://192.168.0.115:8080/?action=stream")
        stream.contentURL = url
        stream.play() // Play the stream
        
        //moved to background?
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        notificationCenter.addObserver(self, selector: #selector(appMovedToForeground), name: UIApplication.willEnterForegroundNotification, object: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Make the Status Bar Light/Dark Content for this View
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
        //return UIStatusBarStyle.default   // Make dark again
    }
    
    @objc func appMovedToBackground() {
        //print("App moved to Background!")
        stream.stop()
    }
    
    @objc func appMovedToForeground() {
        //print("App moved to ForeGround!")
        stream.play()
    }
    
}
