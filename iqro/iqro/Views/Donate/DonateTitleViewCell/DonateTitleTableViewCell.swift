//
//  DonateTitleTableViewCell.swift
//  iqro
//
//  Created by M Hafidh Abdul Aziz on 13/08/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class DonateTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var donateTitleContentView: UIView!
    @IBOutlet weak var donateTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        donateTitle.text = "Donate Now. Choose Your Cause."
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
