//
//  MockNYTNetworkRepo.swift
//  NYTTests
//
//  Created by Ashwaq Alghamdi on 1.11.2025.
//

import Foundation
@testable import NYT

class MockNYTNetworkRepo: NYTNetworkRepo {
    var shouldReturnError = false
    
    func fetchMostPopularArticle(period: Int) async -> Result<NYTModel, Error> {
        if shouldReturnError {
            return .failure(NSError(domain: "TestError", code: 1, userInfo: nil))
        } else {
            let dummyArticle = NYTModel(response: NYTResponse(status: "OK", numResults: 1, results: []))
            return .success(dummyArticle)
        }
    }
}
