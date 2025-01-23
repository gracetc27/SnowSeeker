//
//  HomeView.swift
//  SnowSeeker
//
//  Created by Grace couch on 22/01/2025.
//

import SwiftUI

struct HomeView: View {
    @State private var viewModel = HomeViewModel()

    private func resortView(_ resort: Resort) -> some View {
        ResortView()
            .environment(ResortManager(resort: resort))
    }

    var body: some View {
        NavigationSplitView {
            List(viewModel.sortedResorts()) { resort in
                NavigationLink(destination: resortView(resort)) {
                    HStack {

                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        if viewModel.favourites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                            .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort by", selection: $viewModel.sortByOption) {
                        Text("Sort by name")
                            .tag(HomeViewModel.SortByOptions.name)
                        Text("Sort by country")
                            .tag(HomeViewModel.SortByOptions.country)
                        Text("Sort by default")
                            .tag(HomeViewModel.SortByOptions.none)
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $viewModel.searchText, prompt: "Search for a resort")
        } detail: {
            WelcomeView()
        }
        .environment(viewModel.favourites)


    }
}

#Preview {
    HomeView()
}
