//
//  NYTNetwork.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Foundation

protocol NYTNetworkRepo {
    func fetchMostPopularArticle(period: Int) async -> Result<NYTModel, Error>
}

class NYTNetworkRepoImplementation : NYTNetworkRepo {

    func fetchMostPopularArticle(period: Int) async -> Result<NYTModel, Error> {
        let url = APIEndpoint.mostPopularArticle(period: period).url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let article = try JSONDecoder().decode(NYTResponse.self, from: data)
            return .success(NYTModel(response: article))
        } catch {
            return .failure(error)
        }
    }
}
