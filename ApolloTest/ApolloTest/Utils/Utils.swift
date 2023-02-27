//
//  Util.swift
//  ApolloTest
//
//  Created by James Wang on 2/26/23.
//

import UIKit

class Utils {

    static func decimalFloat(value: Float) -> String {
        let intValue = Int(value)
        if value - Float(intValue) > 0.0 {
            return String(format: "%.2f", value)
        } else {
            return String(Int(value))
        }
    }

}
