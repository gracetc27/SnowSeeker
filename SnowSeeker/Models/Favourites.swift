//
//  Favourites.swift
//  SnowSeeker
//
//  Created by Grace couch on 23/01/2025.
//
import SwiftUI

@Observable
class Favourites {
    private var resorts: Set<String>

    private let key = "Favourites"

    init() {
        let decoder = JSONDecoder()
        if
            let savedResorts = UserDefaults().object(forKey: key) as? Data,
            let loadedResorts = try? decoder.decode(Set<String>.self, from: savedResorts) {
                resorts = loadedResorts
        } else {
            resorts = []
        }
    }

        func contains(_ resort: Resort) -> Bool {
            resorts.contains(resort.id)
        }

        func add(_ resort: Resort) {
            resorts.insert(resort.id)
            save()
        }

        func remove(_ resort: Resort) {
            resorts.remove(resort.id)
            save()
        }

        func save() {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(resorts) {
                let defaults = UserDefaults.standard
                defaults.set(encoded, forKey: key)
            }
        }
    }
