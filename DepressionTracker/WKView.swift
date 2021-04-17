//
//  WKView.swift
//  DepressionTracker
//
//  Created by Daniel Revay on 4/17/21.
//

import Foundation
import UIKit
import WebKit
class WKView: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        let url = Bundle.main.url(forResource:"index",withExtension:"html",subdirectory:"")
        webView.loadFileURL(url!,allowingReadAccessTo:url!)
        let request = URLRequest(url:url!)
        webView.load(myRequest)
        webView.allowsBackForwardNavigationGestures = true
    }}
