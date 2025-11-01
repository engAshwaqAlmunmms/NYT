//
//  ArticleReaderViewModel.swift
//  NYT
//
//  Created by Ashwaq Alghamdi on 31.10.2025.
//

import Foundation
import Combine
import SwiftSoup

final class ArticleReaderViewModel: ObservableObject {
    
    @Published var articleText: String = ""
    @Published var title: String = ""
    @Published var viewState: ViewState = .loading

    func fetchArticle(from urlString: String) async throws {
        guard let url = URL(string: urlString) else { return viewState = .error }

        let (data, _) = try await URLSession.shared.data(from: url)
        guard let html = String(data: data, encoding: .utf8) else { return  viewState = .error }

        let doc: Document = try SwiftSoup.parse(html)
        title = try doc.select("h1").first()?.text() ?? ""

        let paragraphs = try doc.select("section[name=articleBody] p")
        let rawText = try paragraphs.array().map { try $0.text() }.joined(separator: "\n\n")

        let patterns = [
            "We are having trouble retrieving the article content.*",
            "Please enable JavaScript.*",
            "Thank you for your patience while we verify access.*",
            "If you are in Reader mode please exit and log into your Times account.*",
            "Already a subscriber\\?.*",
            "Want all of The Times\\?.*"
        ]

        var cleanedText = rawText
        for pattern in patterns {
            cleanedText = cleanedText.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
        }

        cleanedText = cleanedText
            .components(separatedBy: .newlines)
            .filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
            .joined(separator: "\n\n")

        DispatchQueue.main.async {
            self.articleText = cleanedText
            self.viewState = .loaded
        }
    }
}
