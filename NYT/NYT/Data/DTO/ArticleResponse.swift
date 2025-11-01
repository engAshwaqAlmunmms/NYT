//
//  ArticleResponse.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Foundation

struct ArticleResponse: Decodable, Identifiable {
    let uri: String?
    let url: String?
    let id: Int?
    let publishedDate: String?
    let section: String?
    let subsection: String?
    let nytdsection: String?
    let adxKeywords: String?
    let byline: String?
    let title: String?
    let abstract: String?
    let media: [MediaResponse]?

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case publishedDate = "published_date"
        case section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, title, abstract
        case media
    }
}
