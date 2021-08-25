//
//  WebService.swift
//  MVVMPractice
//
//  Created by ✨EUGENE✨ on 2021/08/25.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion: @escaping([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            else if let data = data { // data를 받아오는지 독립적으로 확인 가능
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                print(articleList)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
