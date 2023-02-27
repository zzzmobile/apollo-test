//
//  ScooterModel.swift
//  ApolloTest
//
//  Created by James Wang on 2/22/23.
//

import UIKit

class Scooter: NSObject {
    var title: String = ""
    var name: String = ""
    var fixed: Float = 0.0
    var monthly: Float = 0.0
    
    init(title: String, name: String, fixed: Float, monthly: Float) {
        self.title = title
        self.name = name
        self.fixed = fixed
        self.monthly = monthly
    }
}
