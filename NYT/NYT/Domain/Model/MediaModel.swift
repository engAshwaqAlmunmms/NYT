//
//  MediaModel.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Foundation

class MediaModel {
    var caption: String? = ""
    var url: String = ""
    var height: Int = 0
    var width: Int = 0
    
    init(response: MediaResponse) {
        self.caption = response.caption
        response.mediaMetadata?.forEach { meta in
            self.url = meta.url
            self.width = meta.width
            self.height = meta.height
        }
    }
}
