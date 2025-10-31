//
//  NYTResponse.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Foundation

// MARK: - Response Model
struct NYTResponse: Decodable {
    let status: String
    let numResults: Int
    let results: [ArticleResponse]

    enum CodingKeys: String, CodingKey {
        case status
        case numResults = "num_results"
        case results
    }
}
