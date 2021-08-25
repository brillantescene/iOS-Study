//
//  Article.swift
//  MVVMPractice
//
//  Created by ✨EUGENE✨ on 2021/08/25.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
