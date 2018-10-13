//
//  WebViewController.swift
//  iqro
//
//  Created by ihsanmaul on 10/13/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var pageTitle = ""
    var webUrl: String?    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = false
        navigationItem.title = pageTitle
        if let urlString = webUrl, let requestUrl = URL(string: urlString) {
            webView.loadRequest(URLRequest(url: requestUrl))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension WebViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("start")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("finish")
    }
}
