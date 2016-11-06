//
//  ViewController.swift
//  vexFlowTest
//
//  Created by Paul Crompton on 11/4/16.
//  Copyright © 2016 Paul Crompton. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var containerView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let wkWebView = WKWebView(frame: CGRect(x: 0, y: 0, width: containerView.frame.width, height: containerView.frame.height))
        wkWebView.navigationDelegate = self
        wkWebView.allowsBackForwardNavigationGestures = false
        wkWebView.isUserInteractionEnabled = false
        
        containerView.addSubview(wkWebView)
        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "vexFlow") {
            let request = URLRequest(url: url)
            wkWebView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let function = "drawStaffWithPitch"
        let pitch = "c/4"
        webView.evaluateJavaScript("\(function)(\"\(pitch)\")")
    }
}

