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
        ScrollView {
            AsyncImage(url: articleImageURL) { image in
                image
                    .resizable()
                    .frame(width: 350, height: 350)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            } placeholder: {
                ProgressView()
                    .frame(width: 350, height: 350)
            }
            
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
        .navigationTitle(viewModel.title)
        .onAppear {
            Task {
                try await viewModel.fetchArticle(from: articleURL)
            }
        }
    }
}

#Preview {
    ArticleDetails(articleImageURL: URL(string: "https://static01.nyt.com/images/2025/10/29/multimedia/29DC-MEMO-gjhp/29DC-MEMO-gjhp-mediumThreeByTwo440-v2.jpg"),
                   articleURL: "https://www.nytimes.com/2025/10/29/us/politics/karine-jean-pierre-book.html",
                   writer: "john")
}
