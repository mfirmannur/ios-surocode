//
//  DonateOptionsCell.swift
//  iqro
//
//  Created by M Hafidh Abdul Aziz on 09/08/18.
//  Copyright © 2018 MyMacbook. All rights reserved.
//

import UIKit

class DonateOptionsCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var donateContentView: UIView!
    @IBOutlet weak var donateOptionCollection: UICollectionView!
    
    let donateItemSections = ["Center Perth","Masjid Iqro","Foundation","Infaq","Emergency"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        donateOptionCollection.delegate = self
        donateOptionCollection.dataSource = self
        
        registerCell()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        donateOptionCollection!.collectionViewLayout = layout
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DonateOptionsItemCellCollectionViewCell", for: indexPath as IndexPath) as! DonateOptionsItemCellCollectionViewCell
        
        switch donateItemSections[indexPath.row] {
        case "Center Perth":
            cell.donateItemImage.image = UIImage(named: "rsz_iqro_center")
            cell.donateItemTitle.text = "IQRO CENTER PERTH PROJECT"
            return cell
        case "Masjid Iqro":
            cell.donateItemImage.image = UIImage(named: "rsz_masjid_upgrade")
            cell.donateItemTitle.text = "MASJID IQRO UPGRADE PROJECT"
            return cell
        case "Foundation":
            cell.donateItemImage.image = UIImage(named: "rsz_iqro_fund")
            cell.donateItemTitle.text = "IQRO FOUNDATION FUND"
            return cell
        case "Infaq":
            cell.donateItemImage.image = UIImage(named: "rsz_infaq_shodaqoh")
            cell.donateItemTitle.text = "INFAQ / SHODAQOH"
            return cell
        case "Emergency":
            cell.donateItemImage.image = UIImage(named: "rsz_emergency_fund")
            cell.donateItemTitle.text = "EMERGENCY FUND"
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func registerCell(){
        let nibName = UINib(nibName: "DonateOptionsItemCellCollectionViewCell", bundle: nil)
        donateOptionCollection.register(nibName, forCellWithReuseIdentifier: "DonateOptionsItemCellCollectionViewCell")
    }
    
}
