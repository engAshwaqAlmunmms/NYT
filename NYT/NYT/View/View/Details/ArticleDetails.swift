//
//  ArticleDetails.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import SwiftUI

struct ArticleDetails: View {
    
    @StateObject private var viewModel = ArticleReaderViewModel()
    let articleImageURL: URL?
    let articleURL: String
    let writer: String
    
    init(articleImageURL: URL?, articleURL: String, writer: String) {
        self.articleURL = articleURL
        self.articleImageURL = articleImageURL ?? URL(string: "")
        self.writer = writer
    }
    
    var body: some View {
        VStack {
            if viewModel.viewState == .loaded {
                loadedView()
            } else if viewModel.viewState == .error {
                ErrorView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            viewModel.viewState = .loaded
                        }
                    }
            }
        }
        .navigationTitle(viewModel.title)
        .onAppear {
            Task {
                try await viewModel.fetchArticle(from: articleURL)
            }
        }
    }
    
    private func loadedView() -> some View {
        ScrollView {
            AsyncImageView(url: articleImageURL, width: 350, height: 350)
            VStack(alignment: .leading, spacing: 12) {
                Text(viewModel.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.orange)
                Text(viewModel.articleText)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                Text(writer)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .bold()
            }
            .padding()
        }
    }
}
