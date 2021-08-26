//
//  WebService.swift
//  MVVMPractice
//
//  Created by ✨EUGENE✨ on 2021/08/25.
//

import Foundation

class WebService {
    // 데이터를 얻고 완료되면 completion 핸들러를 가져옴
    // [Article]을 찾지 못할 수 있으니까 옵셔널 처리 [Article]?
    func getArticles(url: URL, completion: @escaping([Article]?) -> ()) {
        
        // 여기 url로 전달하는 건 dataTask의 completion 핸들러임
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                // [Article] 못 찾았으니까 nil
                completion(nil)
            }
            else if let data = data { // 특정 데이터에서 일부 데이터를 얻을 수 있음.
                // 디코딩을 하지 않으면 그냥 바이트임
                // 이런 바이트를 디코딩해서 모델에 넣어야 함
                /**
                 JSONDecoder.decode(type: Decodable.Protocol, from: Data)
                 디코더에게 우리가 디코딩하는 타입의 종류를 알려줘야 함.
                 디코딩하는 타입은 기본적으로 Article이지만 전체적으로 Article 배열임.
                 
                 JSONDecoder.decode(type: [Article.self], from: Data)
                 이렇게 하면 될까?
                 결과는 nil임. 왜냐하면 JSON이 이렇게 생겼기 때문임.
                 {
                      "status": "ok",
                      "totalResults": 7046,
                    - "articles": [
                        - {
                             -"source": {
                             },
                             "author": "Dashveenjit Kaur",
                             "title": "China tightens smart vehicle data regulation for Tesla and others",
                             "description": "tightens smart vehicle,car,regulations,vehicle data regulation,ministry of industry,smart vehicle data,regulation for tesla,miit,vehicles,china tightens smart,market",
                        ...
                 }
                 article이 루트 요소가 아니기 때문! -> 부모 구조를 하나 더 만들면 됨
                 let articleList = try? JSONDecoder().decode(ArticleList.self, from: data).articles
                 data에서 ArticleList 타입으로 디코딩 하겠다는 뜻
                 */

                
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)

                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
                /**
                 이제 이 데이터를 View Model로 보내보자.
                 View Model이 View에 데이터를 제공하기 때문!
                 
                 왜 Model - View 바로 소통을 하지 않아?
                 -> Model과 UI 간의 깊은 결합을 원하지 않기 때문.
                 */
            }
        }.resume()
    }
}
