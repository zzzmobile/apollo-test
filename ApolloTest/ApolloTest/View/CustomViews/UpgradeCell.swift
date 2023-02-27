//
//  UpgradeCell.swift
//  ApolloTest
//
//  Created by James Wang on 2/22/23.
//

import UIKit

class UpgradeCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var upgradeName: UILabel!
    @IBOutlet weak var upgradeDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backView.layer.borderWidth = 1
        self.backView.layer.borderColor = UIColor(red: 151.0 / 255.0, green: 151.0 / 255.0, blue: 151.0 / 255.0, alpha: 0.34).cgColor
    }

    func setUpgradeInfo(upgradeInfo: ScooterUpgrade) {
        self.upgradeName.text = upgradeInfo.name
        self.upgradeDescription.text = upgradeInfo.details
    }
}
