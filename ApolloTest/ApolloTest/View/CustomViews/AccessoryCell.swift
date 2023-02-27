//
//  AccessoryCell.swift
//  ApolloTest
//
//  Created by James Wang on 2/22/23.
//

import UIKit

class AccessoryCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var accessoryName: UILabel!
    @IBOutlet weak var accessoryDescription: UILabel!
    @IBOutlet weak var accessoryPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backView.layer.borderWidth = 1
        self.backView.layer.borderColor = UIColor(red: 151.0 / 255.0, green: 151.0 / 255.0, blue: 151.0 / 255.0, alpha: 0.34).cgColor
    }

    func setAccessory(accessory: ScooterAccessory) {
        self.accessoryName.text = accessory.name
        self.accessoryDescription.text = accessory.details
        let price = Utils.decimalFloat(value: accessory.price)
        self.accessoryPrice.text = "$\(price) USD"
    }
}
