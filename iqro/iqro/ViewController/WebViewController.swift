//
//  WebViewController.swift
//  iqro
//
//  Created by ihsanmaul on 10/13/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class WebViewController: BaseViewController {

    @IBOutlet weak var webView: UIWebView!
    var pageTitle = ""
    var webUrl: String?    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        navigationItem.title = pageTitle
        if let urlString = webUrl, let requestUrl = URL(string: urlString) {
            showSpinnerWithMask(true)
            webView.isHidden = true
            webView.loadRequest(URLRequest(url: requestUrl))
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

extension WebViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        print("start")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("finish")
        webView.stringByEvaluatingJavaScript(from: "document.getElementById('mobileMenuLink').style.display = 'none'; document.getElementById('header').style.display = 'none'")
        webView.stringByEvaluatingJavaScript(from: "document.getElementsByClassName('top-divider')[0].style.display = 'none'")
        webView.stringByEvaluatingJavaScript(from: "document.getElementsByClassName('PageHeader-content-KtUd-')[0].style.display = 'none'")
        webView.stringByEvaluatingJavaScript(from: "document.getElementsByClassName('header')[0].style.display = 'none'")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showSpinnerWithMask(false)
            webView.isHidden = false
        }
    }
}
