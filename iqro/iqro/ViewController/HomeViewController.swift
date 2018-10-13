//
//  HomeViewController.swift
//  iqro
//
//  Created by MyMacbook on 7/8/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var aboutUsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let aboutUsTap = UITapGestureRecognizer(target: self, action: #selector(self.aboutUsClicked))
        self.aboutUsView.addGestureRecognizer(aboutUsTap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func aboutUsClicked() {
        let webViewPage = UIStoryboard(name: "Webview", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        webViewPage?.webUrl = "http://www.iqro.org.au/history/"
        webViewPage?.pageTitle = "About Us"
        navigationController?.pushViewController(webViewPage!, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
