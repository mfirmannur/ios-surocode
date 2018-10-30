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
        bookFrontView.addGestureRecognizer(bookFrontTapped)
        bookFrontView.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
    }
    
    @objc func bookFrontClicked() {
        
    }

}
