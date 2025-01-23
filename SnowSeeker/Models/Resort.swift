//
//  Resort.swift
//  SnowSeeker
//
//  Created by Grace couch on 22/01/2025.
//
import SwiftUI


struct Resort: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]

    var facilityType: [Facility] {
        facilities.map(Facility.init)
    }


    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]

}
