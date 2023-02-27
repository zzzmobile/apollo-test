//
//  ScooterUpgradeTitleView.swift
//  ApolloTest
//
//  Created by James Wang on 2/26/23.
//

import UIKit

class ScooterUpgradeTitleView: UIView {

    private lazy var pulse: CAGradientLayer = {
        let l = CAGradientLayer()
        l.colors = [UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.46).cgColor,
                    UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.99).cgColor
        ]
        l.locations = [ 0, 1 ]
        l.startPoint = CGPoint(x: 0.0, y: 0.0)
        l.endPoint = CGPoint(x: 0.0, y: 1.0)
        layer.addSublayer(l)
        return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pulse.frame = bounds
    }

}
