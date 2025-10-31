//
//  MediaResponse.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Foundation

struct MediaResponse: Decodable {
    let caption: String?
    let mediaMetadata: [MediaMetadataResponse]?

    enum CodingKeys: String, CodingKey {
        case caption
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - Media Metadata
struct MediaMetadataResponse: Decodable {
    let url: String
    let height: Int
    let width: Int
}
