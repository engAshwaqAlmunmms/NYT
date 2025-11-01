//
//  APIEndpointTests.swift
//  NYTTests
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import XCTest
@testable import NYT

final class APIEndpointTests: XCTestCase {
    
    func test_MostPopularArticleURL() {
        let period = 1
        
        let expectedURLString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/1.json?api-key=NdoTo0NSFqbn7CUbEdSJVnudQgcIeyLV"
        
        let url = APIEndpoint.mostPopularArticle(period: period).url
        XCTAssertEqual(url.absoluteString, expectedURLString, "URL for period \(period) is incorrect")
    }
    
    func test_APIKeyIsIncluded() {
        let url = APIEndpoint.mostPopularArticle(period: 1).url
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let apiKeyItem = components?.queryItems?.first(where: { $0.name == "api-key" })
        
        XCTAssertNotNil(apiKeyItem, "URL is missing api-key")
    }
    
    func test_APIKeyIsCorrect() {
        let expectedAPIKey = "NdoTo0NSFqbn7CUbEdSJVnudQgcIeyLV"
        
        let url = APIEndpoint.mostPopularArticle(period: 1).url
        let components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        let apiKeyItem = components?.queryItems?.first(where: { $0.name == "api-key" })
        
        XCTAssertEqual(apiKeyItem?.value, expectedAPIKey, "API key is incorrect")
    }
}
