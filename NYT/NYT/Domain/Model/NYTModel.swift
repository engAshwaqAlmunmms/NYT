//
//  NYTModel.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Foundation

class NYTModel {
    var status: String = ""
    var numResults: Int = 1
    var results: [ArticleModel] = []
    
    init(response: NYTResponse) {
        self.status = response.status ?? ""
        self.numResults = response.numResults ?? 0
        self.results = response.results?.map { ArticleModel(response: $0) } ?? []
    }
}
