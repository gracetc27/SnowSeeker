//
//  ResortDetailView.swift
//  SnowSeeker
//
//  Created by Grace couch on 22/01/2025.
//

import SwiftUI

struct ResortDetailView: View {
    @Environment(ResortManager.self) var resortManager

    var body: some View {
        Group {
              VStack {
                  Text("Size")
                      .font(.caption.bold())
                  Text(resortManager.size)
                      .font(.title3)
              }

              VStack {
                  Text("Price")
                      .font(.caption.bold())
                  Text(resortManager.price)
                      .font(.title3)
              }
          }
          .frame(maxWidth: .infinity)
    }
}


#Preview {
    ResortDetailView()
        .environment(ResortManager(resort: .example))
}
