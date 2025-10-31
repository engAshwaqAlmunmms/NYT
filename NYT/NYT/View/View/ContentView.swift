//
//  ContentView.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ArticleViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .onTapGesture {
                    Task {
                        try await viewModel.getData(period: 1)
                    }
                }
        }
        .padding()
    }
}
