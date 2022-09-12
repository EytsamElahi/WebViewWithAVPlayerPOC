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
        setupWKVebView()
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
    
    
    
    func loadVideoFromAVPlayer(for link: String){
        let videoURL = URL(string: link)
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        player.play()
    }
    
    func setupWKVebView(){
        let webConfiguration = WKWebViewConfiguration()
        let contentController = WKUserContentController()
        // Inject JavaScript which sending message to App
        //              let js: String = "window.webkit.messageHandlers.callbackHandler.postMessage('Hello from JavaScript');"
        //              let userScript = WKUserScript(source: js, injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: false)
        //              contentController.removeAllUserScripts()
        //              contentController.addUserScript(userScript)
        //              // Add ScriptMessageHandler
        //              contentController.add(
        //                  self,
        //                  name: "callbackHandler"
        //              )
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
