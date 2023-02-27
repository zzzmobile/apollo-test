//
//  Accessory.swift
//  ApolloTest
//
//  Created by James Wang on 2/22/23.
//
import UIKit

class ScooterAccessory: NSObject {
    var name: String = ""
    var details: String = ""
    var price: Float = 0.0
    
    init(name: String, details: String, price: Float) {
        self.name = name
        self.details = details
        self.price = price
    }
}
