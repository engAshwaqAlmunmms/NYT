//
//  ArticleDetails.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import SwiftUI

struct ArticleDetails: View {
    
    @StateObject private var viewModel = ArticleViewModel()
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    var body: some View {
        VStack {
            Text("k")
        }
    }
}

#Preview {
    ArticleDetails(url: URL(string: " https://www.nytimes.com/2025/10/29/us/politics/karine-jean-pierre-book.html")!)
}
