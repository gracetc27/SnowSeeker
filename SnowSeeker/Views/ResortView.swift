//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Grace couch on 22/01/2025.
//

import SwiftUI

struct ResortView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    @Environment(Favourites.self) var favourites
    @Environment(ResortManager.self) var resortManager

    @State private var selectedFacility: Facility?
    @State private var showingFacility = false


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomTrailing) {
                    Image(decorative: resortManager.resort.id)
                        .resizable()
                        .scaledToFit()
                    HStack(spacing: 2) {
                        Image(systemName: "camera.viewfinder")

                        Text(resortManager.resort.imageCredit)
                    }
                    .font(.caption2)
                    .padding(.horizontal, 2)
                    .background(.ultraThinMaterial)
                }
                HStack {
                    if horizontalSizeClass == .compact && dynamicTypeSize > .large {
                        VStack(spacing: 10) { SkiDetailView() }
                        VStack(spacing: 10) { ResortDetailView() }
                    } else {
                        SkiDetailView()
                        ResortDetailView()
                    }
                }
                .padding(.vertical, 10)
                .background(.thinMaterial)

                Group {
                    Text(resortManager.resort.description)
                        .padding(.vertical, 10)

                    Text("Facilities")
                        .font(.headline)
                        .padding(.vertical, 10)

                    HStack {
                        ForEach(resortManager.resort.facilityType) { facility in
                            Button {
                                selectedFacility = facility
                                showingFacility = true
                            } label: {
                                facility.icon
                                    .font(.title)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
        .toolbar {
            Button(favourites.contains(resortManager.resort) ? "Remove from Favourites" : "Add to Favourites", systemImage: favourites.contains(resortManager.resort) ? "heart.fill" : "heart") {
                if favourites.contains(resortManager.resort) {
                    favourites.remove(resortManager.resort)
                } else {
                    favourites.add(resortManager.resort)
                }
            }
        }
        .navigationTitle("\(resortManager.resort.name), \(resortManager.resort.country)")
        .navigationBarTitleDisplayMode(.inline)
        .alert(selectedFacility?.name ?? "More info", isPresented: $showingFacility, presenting: selectedFacility) { _ in
        } message: { facility in
            Text(facility.description)
        }
    }
}

#Preview {
    ResortView()
        .environment(Favourites())
        .environment(ResortManager(resort: .example))
}
