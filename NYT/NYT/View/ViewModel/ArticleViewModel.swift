//
//  ArticleViewModel.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Combine
import Foundation

enum ViewState {
    case loading
    case loaded
    case error
}

class ArticleViewModel: ObservableObject {
    
    @Published var article: NYTModel?
    @Published var viewState: ViewState = .loading

    func getData(period: Int) async throws  {
        let news = try await GetMostPopularArticles().execute(period: period)
        switch news {
        case .success(let article):
            self.article = article
            self.viewState = .loaded
        case .failure(let error):
            print(error.localizedDescription)
            self.viewState = .error
        }
    }
}
