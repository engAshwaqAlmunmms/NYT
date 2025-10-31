//
//  APIEndpoint.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Foundation

enum APIEndpoint {
    case mostPopularArticle(period: Int)
    
    var url: URL {
        switch self {
        case .mostPopularArticle(let period):
            return URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(period).json?api-key=NdoTo0NSFqbn7CUbEdSJVnudQgcIeyLV")!
        }
    }
}
