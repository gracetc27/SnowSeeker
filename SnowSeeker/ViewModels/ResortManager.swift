//
//  ResortManager.swift
//  SnowSeeker
//
//  Created by Grace couch on 23/01/2025.
//

import SwiftUI

@Observable
class ResortManager {
    let resort: Resort

    var price: String {
        String(repeating: "£", count: resort.price)
    }
    var size: String {
        switch resort.size {
        case 1: "Small"
        case 2: "Average"
        default: "Large"
        }
    }
    init(resort: Resort) {
        self.resort = resort
    }
}
