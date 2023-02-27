//
//  CellBackgroundView.swift
//  ApolloTest
//
//  Created by James Wang on 2/25/23.
//

import UIKit

class CellBackgroundView: UIView {

    private lazy var pulse: CAGradientLayer = {
        let l = CAGradientLayer()
                l.type = .radial
        l.colors = [ UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.08).cgColor,
                     UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.0001).cgColor,
                     UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.08).cgColor,
//                     UIColor(red: 49.0/255.0, green: 49.0/255.0, blue: 49.0/255.0, alpha: 0.6).cgColor
        ]
        l.locations = [ 0,
                        0.1,
                        0.3,
//                        1
        ]
        l.startPoint = CGPoint(x: 0.0, y: 0.0)
        l.endPoint = CGPoint(x: 0.7963, y: 0.5504)
                layer.addSublayer(l)
                return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        pulse.frame = bounds
    }

}
