//
//  Article.swift
//  MVVMPractice
//
//  Created by ✨EUGENE✨ on 2021/08/25.
//

import Foundation

// 여기서 이름들이 중요함. JSON에 있는 요소들과 이름이 일치할 때 디코딩할 수 있음.

struct ArticleList: Decodable {
    let articles: [Article]
}

// JSON 모델로 디코딩하기 위해서 Decodable 프로토콜을 채택할 거임
// Codable을 쓸 수도 있지만 이 예제에서는 데이터를 서버로 다시 보내는 것이 아니므로 인코딩이 필요없음
// 그래서 Decodable만 사용함
struct Article: Decodable {
    let title: String?
    let description: String?
}
