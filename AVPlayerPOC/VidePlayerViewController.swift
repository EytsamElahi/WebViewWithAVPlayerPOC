//
//  VidePlayerViewController.swift
//  AVPlayerPOC
//
//  Created by Mac on 08/09/2022.
//

import UIKit
import WebKit
import AVKit
import AVFoundation

class VidePlayerViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    var webView: WKWebView!
    let youtubeUrl: String = "https://www.youtube.com/embed/aExhdrtOGC0"
    let rumbleUrl: String = "https://rumble.com/embed/v1f45hp/?pub=4"
    
    var isYoutube: Bool = false
    
    override func loadView() {
        setupWKWebView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isYoutube {
            loadWKVebView(for: youtubeUrl)
            self.title = "Youtube"
        } else {
            loadWKVebView(for: rumbleUrl)
            self.title = "Rumble"
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    private func loadVideoFromAVPlayer(for link: String){
        let videoURL = URL(string: link)
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    private func setupWKWebView(){
        let webConfiguration = WKWebViewConfiguration()
        let contentController = WKUserContentController()
        webConfiguration.userContentController = contentController
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    func loadWKVebView(for link: String) {
        let myURL = URL(string: link)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
