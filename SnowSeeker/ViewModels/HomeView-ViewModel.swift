//
//  HomeView-ViewModel.swift
//  SnowSeeker
//
//  Created by Grace couch on 23/01/2025.
//
import SwiftUI

@Observable
class HomeViewModel {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    var searchText = ""
    var favourites = Favourites()
    var sortByOption = SortByOptions.none
    enum SortByOptions: String {
        case name = "Name"
        case country = "Country"
        case none = "None"
    }
    
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            resorts
        } else {
            resorts.filter {
                $0.name.localizedStandardContains(searchText)
            }
        }
    }
    func sortedResorts() -> [Resort] {
        switch sortByOption {
        case .name:
            return filteredResorts.sorted { $0.name < $1.name }
        case .country:
            return filteredResorts.sorted { $0.country < $1.country }
        case .none:
            return filteredResorts
        }
    }
}
