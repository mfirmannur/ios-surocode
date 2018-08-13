//
//  DonateFooterViewCell.swift
//  iqro
//
//  Created by M Hafidh Abdul Aziz on 13/08/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class DonateFooterViewCell: UITableViewCell {

    @IBOutlet weak var donateFooterTitle: UIView!
    @IBOutlet weak var donateFooterTitleLabel: UILabel!
    @IBOutlet weak var donateFooterContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
