//
//  ScotterTableViewCell.swift
//  ApolloTest
//
//  Created by James Wang on 2/22/23.
//

import UIKit

class ScooterTableViewCell: UITableViewCell {

    @IBOutlet weak var scooterNameText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
