//
//  ViewController.swift
//  AVPlayerPOC
//
//  Created by Mac on 08/09/2022.
//

import UIKit
import AVFoundation
import AVKit
import WebKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction
    func youtubePlay() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VidePlayerViewController") as! VidePlayerViewController
        vc.isYoutube = true
        self.navigationController?.pushViewController(vc, animated: true)
        //loadWKVebView(for: youtubeUrl)
    }
    @IBAction
    func rumblePlay() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "VidePlayerViewController") as! VidePlayerViewController
        vc.isYoutube = false
        self.navigationController?.pushViewController(vc, animated: true)
        //loadWKVebView(for: rumbleUrl)
    }
    
}

