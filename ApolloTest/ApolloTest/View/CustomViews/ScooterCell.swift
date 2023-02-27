//
//  ApolloCareCell.swift
//  ApolloTest
//
//  Created by James Wang on 2/22/23.
//

import UIKit

class ScooterCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var scooterTitle: UILabel!
    @IBOutlet weak var scooterName: UILabel!
    @IBOutlet weak var scooterPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.backView.layer.borderWidth = 1
        self.backView.layer.borderColor = UIColor(red: 151.0 / 255.0, green: 151.0 / 255.0, blue: 151.0 / 255.0, alpha: 0.34).cgColor
    }

    func setScooter(scooter: Scooter) {
        self.scooterTitle.text = scooter.title
        self.scooterName.text = scooter.name
        let fixed = Utils.decimalFloat(value: scooter.fixed)
        let monthly = Utils.decimalFloat(value: scooter.monthly)
        self.scooterPrice.text = "$\(fixed) USD or $\(monthly)/mo."
    }
}
