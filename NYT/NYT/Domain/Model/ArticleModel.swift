//
//  ArticleModel.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Foundation

class ArticleModel {
    var url: String = ""
    var id: Int = 0
    var publishedDate: String = ""
    var subsection: String = ""
    var nytdsection: String = ""
    var keywords: String = ""
    var writer: String = ""
    var title: String = ""
    var media: [MediaModel]
    
    init(response: ArticleResponse) {
        self.url = response.url ?? ""
        self.id = response.id ?? 0
        self.publishedDate = response.publishedDate ?? ""
        self.subsection = response.subsection ?? ""
        self.nytdsection = response.nytdsection ?? ""
        self.keywords = response.adxKeywords ?? ""
        self.writer = response.byline ?? ""
        self.title = response.title ?? ""
        self.media = response.media?.map { MediaModel(response: $0) } ?? []
    }
}
