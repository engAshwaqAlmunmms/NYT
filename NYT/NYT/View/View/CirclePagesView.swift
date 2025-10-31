//
//  CirclePagesView.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 1.11.2025.
//

import SwiftUI

struct CirclePagesView: View {
    
    @ObservedObject var viewModel: ArticleViewModel
    @State private var currentPage = 0
    let totalPages: [Int] = [1, 7, 30]
    
    var body: some View {
        VStack {
            HStack(spacing: 8) {
                ForEach(0..<totalPages.count, id: \.self) { index in
                    Button(action: {
                        withAnimation {
                            currentPage = index
                            Task {
                                try await viewModel.getData(period: totalPages[index])
                            }
                        }
                    }) {
                        Circle()
                            .fill(index == currentPage ? Color.orange : Color.gray.opacity(0.3))
                            .frame(width: 35, height: 35)
                            .overlay {
                                Text("\(totalPages[index])")
                            }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
}
