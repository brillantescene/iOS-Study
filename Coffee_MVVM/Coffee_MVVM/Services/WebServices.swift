//
//  WebServices.swift
//  Coffee_MVVM
//
//  Created by ✨EUGENE✨ on 2021/08/28.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}
struct Resource<T: Codable> { // Codable이 아니면 결과를 다시 매핑할 수 없음
    let url: URL
}

class WebService {
    
    // 클로저가 탈출할 것이기 때문에 completion을 @escaping 클로저
    // 성공 시 Result<T>를 얻고, 에러 시 NetworkError
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            // 디코딩을 해보자
            let result = try? JSONDecoder().decode(T.self, from: data)
            dump(data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
}
