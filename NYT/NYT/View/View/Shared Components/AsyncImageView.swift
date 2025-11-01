//
//  AsyncImageView.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 1.11.2025.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL?
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat

    init(url: URL?, width: CGFloat = 150, height: CGFloat = 150, cornerRadius: CGFloat = 6) {
        self.url = url
        self.width = width
        self.height = height
        self.cornerRadius = cornerRadius
    }

    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        } placeholder: {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
}
