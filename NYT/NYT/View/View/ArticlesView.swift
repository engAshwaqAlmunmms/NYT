//
//  ContentView.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import SwiftUI

struct ArticlesView: View {
    
    @StateObject private var viewModel = ArticleViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("The New York Times")
                    .font(.system(size: 40, weight: .black, design: .serif))
                    .bold()
                    .padding(.trailing, 200)
                CirclePagesView(viewModel: viewModel)
                    .padding(.trailing, 260)

                List(viewModel.article?.results ?? [], id: \.id) { item in
                    NavigationLink(destination: ArticleDetails(articleImageURL: item.media.first?.url,
                                                               articleURL: item.url,
                                                               writer: item.writer)) {
                        HStack(spacing: 12) {
                            AsyncImage(url: item.media.last?.url) { image in
                                image
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 150, height: 150)
                            }
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
            .onAppear {
                Task {
                    try await viewModel.getData(period: 1)
                }
            }
        }
    }
}

#Preview {
    ArticlesView()
}
