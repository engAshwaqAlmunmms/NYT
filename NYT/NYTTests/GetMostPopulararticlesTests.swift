//
//  GetMostPopulararticlesTests.swift
//  NYTTests
//
//  Created by Ashwaq Alghamdi on 1.11.2025.
//

import XCTest
@testable import NYT

final class GetMostPopularArticlesTests: XCTestCase {
    
    func test_ExecuteReturnsSuccess() async throws {
        let mockRepo = MockNYTNetworkRepo()
        let useCase = GetMostPopularArticlesMockUseCase(repo: mockRepo)
        
        let result = try await useCase.execute(period: 7)
        Task {
            switch result {
            case .success(let model):
                let status = model.status
                let count = model.results.count
                let byline = model.results.first?.writer
                let id = model.results.first?.id
                XCTAssertEqual(status, "OK")
                XCTAssertEqual(count, 0)
                XCTAssertEqual(byline, "By Ashwaq")
                XCTAssertEqual(id, 90)
            case .failure:
                XCTFail("Expected success but got failure")
            }
        }
    }
    
    func test_ExecuteReturnsFailure() async throws {
        let mockRepo = MockNYTNetworkRepo()
        mockRepo.shouldReturnError = true
        let useCase = GetMostPopularArticlesMockUseCase(repo: mockRepo)
        
        let result = try await useCase.execute(period: 7)
        
        switch result {
        case .success:
            XCTFail("Expected failure but got success")
        case .failure(let error):
            XCTAssertNotNil(error)
        }
    }
}
