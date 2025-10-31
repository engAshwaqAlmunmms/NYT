//
//  GetMostPopularArticles.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Foundation

class GetMostPopularArticles {
        
    public func execute(period: Int) async throws -> Result<NYTModel, Error>  {
        let article = await NYTNetworkRepoImplementation().fetchMostPopularArticle(period: period)
        return article
    }
}
