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
        self.donateTableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.isHidden = true
        registerCell()
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
        return donateViewSections.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch donateViewSections[indexPath.section] {
        case "Donate Option Collection":
            return 620;
        default:
            return UITableViewAutomaticDimension
        }
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
