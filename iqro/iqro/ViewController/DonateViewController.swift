//
//  DonateViewController.swift
//  iqro
//
//  Created by M Hafidh Abdul Aziz on 09/08/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class DonateViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var donateTableView: UITableView!
    let donateViewSections = ["Donate Title Section", "Iqro Perth", "Iqro Upgrade", "Iqro Foundation", "Infaq", "Emergency Fund", "Donate Footer 1","Donate Footer 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.donateTableView.delegate = self
        self.donateTableView.dataSource = self
        self.donateTableView.rowHeight = UITableViewAutomaticDimension
        self.donateTableView.backgroundColor = UIColor(hexString: "#DCDCDC")
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        registerCell()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func registerCell(){
        let titleNibName = UINib(nibName: "DonateTitleTableViewCell", bundle: nil)
        donateTableView.register(titleNibName, forCellReuseIdentifier: "DonateTitleTableViewCell")
        
        let donateOptionNibName = UINib(nibName: "DonateOptionsCell", bundle: nil)
        donateTableView.register(donateOptionNibName, forCellReuseIdentifier: "DonateOptionsCell")
        
        let donateFooterNibName = UINib(nibName: "DonateFooterViewCell", bundle: nil)
        donateTableView.register(donateFooterNibName, forCellReuseIdentifier: "DonateFooterViewCell")
    }
    
    func gotoWebView(url: String) {
        let webViewPage = UIStoryboard(name: "Webview", bundle: nil).instantiateViewController(withIdentifier: "WebViewController") as? WebViewController
        webViewPage?.webUrl = url
        webViewPage?.pageTitle = "Donate"
        navigationController?.pushViewController(webViewPage!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func renderDonateOptionCell(image: String, title: String, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DonateOptionsCell", for: indexPath as IndexPath) as! DonateOptionsCell
        cell.donateListTitle.text = title
        cell.donateListImage.image = UIImage(named: image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch donateViewSections[indexPath.section] {
        case "Iqro Perth", "Iqro Upgrade":
            return 80;
        default:
            return UITableViewAutomaticDimension
        }
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return donateViewSections.count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(hexString: "#DCDCDC")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch donateViewSections[indexPath.section] {
        case "Iqro Perth":
            gotoWebView(url: "https://secure.squarespace.com/checkout/donate?donatePageId=5b18f1552b6a28f91fae28eb")
        case "Iqro Upgrade":
            gotoWebView(url: "https://secure.squarespace.com/checkout/donate?donatePageId=5531e6fde4b0ed810ce0c068")
        case "Iqro Foundation":
            gotoWebView(url: "https://secure.squarespace.com/checkout/donate?donatePageId=5531eaa0e4b0c604b971cb3c")
        case "Infaq":
            gotoWebView(url: "https://secure.squarespace.com/checkout/donate?donatePageId=5531ea31e4b097f3080551b5")
        case "Emergency Fund":
            gotoWebView(url: "https://secure.squarespace.com/checkout/donate?donatePageId=553350b8e4b003aefe3f574e")
        default:
            break
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        switch donateViewSections[indexPath.section] {
        case "Donate Title Section":
            cell = tableView.dequeueReusableCell(withIdentifier: "DonateTitleTableViewCell", for: indexPath as IndexPath) as! DonateTitleTableViewCell
            return cell!
        case "Iqro Perth":
            return renderDonateOptionCell(image: "ic_moon", title: "IQRO CENTER PERTH PROJECT", tableView: tableView, indexPath: indexPath)
        case "Iqro Upgrade":
            return renderDonateOptionCell(image: "ic_mosque", title: "MASJID IQRO UPGRADE PROJECT", tableView: tableView, indexPath: indexPath)
        case "Iqro Foundation":
            return renderDonateOptionCell(image: "ic_coins", title: "IQRO FOUNDATION FUND", tableView: tableView, indexPath: indexPath)
        case "Infaq":
            return renderDonateOptionCell(image: "ic_gift", title: "INFAQ / SHODAQOH", tableView: tableView, indexPath: indexPath)
        case "Emergency Fund":
            return renderDonateOptionCell(image: "ic_emergency", title: "EMERGENCY FUND", tableView: tableView, indexPath: indexPath)
        case "Donate Footer 1":
            cell = tableView.dequeueReusableCell(withIdentifier: "DonateFooterViewCell", for: indexPath as IndexPath) as! DonateFooterViewCell
            (cell as! DonateFooterViewCell).donateFooterTitle.isHidden = false
            (cell as! DonateFooterViewCell).donateFooterTitleLabel.text = "Other ways to donate."
            (cell as! DonateFooterViewCell).donateFooterContentLabel.text = """
            Bank Transfer (IQRO Foundation Fund)
            
            Commonwealth Bank of Australia
            Account name: IQRO Foundation
            BSB: 062-475
            BIC/SWIFT:CTABAAU2S
            Account no.: 10166179
            Reference: Your_Name & Phone_Number
            """
            return cell!
        case "Donate Footer 2":
            cell = tableView.dequeueReusableCell(withIdentifier: "DonateFooterViewCell", for: indexPath as IndexPath) as! DonateFooterViewCell
            (cell as! DonateFooterViewCell).donateFooterTitle.isHidden = true
            (cell as! DonateFooterViewCell).donateFooterContentLabel.text = """
            IQRO CENTRE PERTH PROJECT
            
            Account name: IQRO Australia New Zealand Ltd
            BSB: 066-162
            BIC/SWIFT: CTBAAU2S
            Account no.: 10753348
            Reference: Your_Name - IQRO DC
            """
            return cell!
        default:
            return UITableViewCell()
        }
    }

}
