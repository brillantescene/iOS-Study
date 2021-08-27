//
//  ArticleViewModel.swift
//  MVVMPractice
//
//  Created by ✨EUGENE✨ on 2021/08/26.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    
    // numberOfSection 정의
    var numberOfSections: Int {
        return 1
    }
    
    // numberOfRowInSection에 리턴해줄 함수
    func numberOfRowsInSections(_ section: Int) -> Int {
        return self.articles.count
    }
    
    // cellForRowAt에 넣어줄 함수
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }

}


struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String? {
        return self.article.title
    }
    var description: String? {
        return self.article.description
    }
}
