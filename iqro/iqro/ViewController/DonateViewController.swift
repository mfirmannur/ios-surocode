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
    let donateViewSections = ["Donate Title Section","Donate Option Collection","Donate Footer 1","Donate Footer 2"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.donateTableView.delegate = self
        self.donateTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        registerCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch donateViewSections[indexPath.section] {
        case "Donate Title Section":
            return 50
        case "Donate Option Collection":
            return 650
        case "Donate Footer 1":
            return 200
        case "Donate Footer 2":
            return 150
        default:
            return 0
        }
    }
    
    func registerCell(){
        let titleNibName = UINib(nibName: "DonateTitleTableViewCell", bundle: nil)
        donateTableView.register(titleNibName, forCellReuseIdentifier: "DonateTitleTableViewCell")
        
        let donateOptionNibName = UINib(nibName: "DonateOptionsCell", bundle: nil)
        donateTableView.register(donateOptionNibName, forCellReuseIdentifier: "DonateOptionsCell")
        
        let donateFooterNibName = UINib(nibName: "DonateFooterViewCell", bundle: nil)
        donateTableView.register(donateFooterNibName, forCellReuseIdentifier: "DonateFooterViewCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell?
        
        switch donateViewSections[indexPath.section] {
        case "Donate Title Section":
            cell = tableView.dequeueReusableCell(withIdentifier: "DonateTitleTableViewCell", for: indexPath as IndexPath) as! DonateTitleTableViewCell
            return cell!
        case "Donate Option Collection":
            cell = tableView.dequeueReusableCell(withIdentifier: "DonateOptionsCell", for: indexPath as IndexPath) as! DonateOptionsCell
            return cell!
        case "Donate Footer 1":
            cell = tableView.dequeueReusableCell(withIdentifier: "DonateFooterViewCell", for: indexPath as IndexPath) as! DonateFooterViewCell
            (cell as! DonateFooterViewCell).donateFooterTitle.isHidden = false
            (cell as! DonateFooterViewCell).donateFooterTitleLabel.text = "Other ways to donate."
            (cell as! DonateFooterViewCell).donateFooterContentLabel.text = "Bank Transfer (IQRO Foundation Fund)\n\nCommonwealth Bank of Australia\nAccount name: IQRO Foundation\nBSB: 062-475\nBIC/SWIFT:CTABAAU2S\nAccount no.: 10166179\nReference: Your_Name & Phone_Number"
            return cell!
        case "Donate Footer 2":
            cell = tableView.dequeueReusableCell(withIdentifier: "DonateFooterViewCell", for: indexPath as IndexPath) as! DonateFooterViewCell
            (cell as! DonateFooterViewCell).donateFooterTitle.isHidden = true
            (cell as! DonateFooterViewCell).donateFooterContentLabel.text = "IQRO CENTRE PERTH PROJECT\n\nAccount name: IQRO Australia New Zealand Ltd\nBSB: 066-162\nBIC/SWIFT: CTBAAU2S\nAccount no.: 10753348\nReference: Your_Name - IQRO DC"
            return cell!
        default:
            return UITableViewCell()
        }
    }

}
