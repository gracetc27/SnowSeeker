//
//  SkiDetailView.swift
//  SnowSeeker
//
//  Created by Grace couch on 22/01/2025.
//

import SwiftUI

struct SkiDetailView: View {
    @Environment(ResortManager.self) var resortManager
    var body: some View {
        Group {
            VStack {
                Text("Elevation")
                    .font(.caption.bold())
                Text("\(resortManager.resort.elevation)m")
                    .font(.title3)
            }

            VStack {
                Text("Snow")
                    .font(.caption.bold())
                Text("\(resortManager.resort.snowDepth)cm")
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    SkiDetailView()
        .environment(ResortManager(resort: .example))
}
