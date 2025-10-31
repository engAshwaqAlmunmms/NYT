//
//  ContentView.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .onTapGesture {
//                    Task {
//                        await NYTNetwork().fetchMostPopularArticle(period: 1)
//                    }
                }
            Text("Hello, world!")
        }
        .padding()
    }
}
