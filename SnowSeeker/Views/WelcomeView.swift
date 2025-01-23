//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Grace couch on 22/01/2025.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            Image(systemName: "figure.skiing.downhill.circle.fill")
                .font(.largeTitle)
            Text("Please select a resort from the side menu; swipe from the edge to show it.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
