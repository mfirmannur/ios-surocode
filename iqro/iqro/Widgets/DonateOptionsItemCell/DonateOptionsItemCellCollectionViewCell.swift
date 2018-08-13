//
//  DonateOptionsItemCellCollectionViewCell.swift
//  iqro
//
//  Created by M Hafidh Abdul Aziz on 09/08/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class DonateOptionsItemCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var donateItemTitle: UILabel!
    @IBOutlet weak var donateItemViewBackgrond: UIView!
    @IBOutlet weak var donateItemImage: UIImageView!
    @IBOutlet weak var donateContentView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        makeBorderContent()
        donateItemViewBackgrond.alpha = 0.5
        // Initialization code
    }
    
    func makeBorderContent() {
        donateContentView.layer.borderWidth = 0.5
        donateContentView.layer.cornerRadius = 5
        donateContentView.layer.borderColor = UIColor.lightGray.cgColor
        donateContentView.layer.shadowColor = UIColor.lightGray.cgColor
        donateContentView.layer.shadowOffset = CGSize(width: 2, height: 2)
        donateContentView.layer.shadowOpacity = 1.0
        donateContentView.layer.shadowRadius = 2.0
    }

}
