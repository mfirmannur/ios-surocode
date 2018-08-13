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
    let donateViewSections = ["Donate Option Collection"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.donateTableView.delegate = self
        self.donateTableView.dataSource = self
        // Do any additional setup after loading the view.
        
        registerCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 700
    }
    
    func registerCell(){
        let nibName = UINib(nibName: "DonateOptionsCell", bundle: nil)
        donateTableView.register(nibName, forCellReuseIdentifier: "DonateOptionsCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DonateOptionsCell", for: indexPath as IndexPath) as! DonateOptionsCell
        switch donateViewSections[indexPath.section] {
        case "Donate Option Collection":
            return cell
        default:
            return UITableViewCell()
        }
    }

}
