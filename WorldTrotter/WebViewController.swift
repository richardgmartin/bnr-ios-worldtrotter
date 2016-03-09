//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Richard Martin on 2016-03-08.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

import UIKit


class WebViewController: UIViewController {
    
    
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let url = NSURL (string: "http://melioguide.com")
        let urlObject = NSURLRequest(URL: url!)
        webView.loadRequest(urlObject)
    }
}