//
//  BookingViewController.swift
//  iqro
//
//  Created by M Hafidh Abdul Aziz on 09/08/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {
    
    @IBOutlet weak var bookFrontView: UIView!
    @IBOutlet weak var bookRearView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bookFrontTapped = UITapGestureRecognizer(target: self, action: #selector(self.bookFrontClicked))
        let bookRearTapped = UITapGestureRecognizer(target: self, action: #selector(self.bookRearClicked))
        bookRearView.addGestureRecognizer(bookRearTapped)
        bookRearView.isUserInteractionEnabled = true
        bookFrontView.addGestureRecognizer(bookFrontTapped)
        bookFrontView.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func bookFrontClicked() {
        let webViewPage = UIStoryboard(name: "Webview", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        webViewPage?.webUrl = "https://iqrofoundationfront.youcanbook.me/"
        webViewPage?.pageTitle = "IQRO BUILDING | Room Hire"
        navigationController?.pushViewController(webViewPage!, animated: true)
        tabBarController?.hidesBottomBarWhenPushed = true
    }
    
    @objc func bookRearClicked() {
        let webViewPage = UIStoryboard(name: "Webview", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        webViewPage?.webUrl = "https://iqrofoundationrear.youcanbook.me/"
        webViewPage?.pageTitle = "IQRO BUILDING | Room Hire"
        navigationController?.pushViewController(webViewPage!, animated: true)
        tabBarController?.hidesBottomBarWhenPushed = true
    }

}
