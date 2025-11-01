//
//  ContentView.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import SwiftUI

struct ArticlesView: View {
    
    @StateObject private var viewModel = ArticleViewModel()
    @State private var currentPage = 0

    var body: some View {
        VStack {
            if viewModel.viewState == .loaded {
                loadedView()
            } else if viewModel.viewState == .error {
                ErrorView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            viewModel.viewState = .loaded
                        }
                    }
            }
        }
        .onAppear {
            Task {
                try await viewModel.getData(period: 1)
            }
        }
    }
    
    private func loadedView() -> some View {
        NavigationView {
            VStack {
                Text("The New York Times")
                    .font(.system(size: 40, weight: .black, design: .serif))
                    .bold()
                    .padding(.trailing, 200)
                
                CirclePagesView(viewModel: viewModel, currentPage: $currentPage)
                    .padding(.trailing, 200)
                
                List(viewModel.article?.results ?? [], id: \.id) { item in
                    NavigationLink(destination: ArticleDetails(articleImageURL: item.media.first?.url,articleURL: item.url,writer: item.writer)) {
                        HStack(spacing: 12) {
                            AsyncImageView(url: item.media.last?.url)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(item.title)
                                    .font(.title3)
                                Text(item.publishedDate)
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                                Text(item.writer)
                                    .font(.caption2)
                                    .lineLimit(1)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .listStyle(.plain)
            }
        }
    }
}

#Preview {
    ArticlesView()
}
