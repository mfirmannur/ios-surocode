//
//  UpdatesTableViewCell.swift
//  iqro
//
//  Created by admin on 7/8/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class UpdatesTableViewCell: UITableViewCell {
    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
