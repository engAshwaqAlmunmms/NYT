//
//  GetMostPopularArticlesMockUseCase.swift
//  NYTTests
//
//  Created by Ashwaq Alghamdi on 1.11.2025.
//

import Foundation
@testable import NYT

class GetMostPopularArticlesMockUseCase {
    private let repo: NYTNetworkRepo
    
    init(repo: NYTNetworkRepo) {
        self.repo = repo
    }
    
    public func execute(period: Int) async throws -> Result<NYTModel, Error> {
        let article = await repo.fetchMostPopularArticle(period: period)
        return article
    }
}
