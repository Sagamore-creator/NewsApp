//  Created by Lech Lipnicki on 2021-02-15.
//

import Foundation

struct NewsListViewModel {
    let articles: [Article]
}

extension NewsListViewModel {

    var numberOfSections: Int {
        return 1
    }

    func numberOfRowsInSections(_ section: Int) -> Int {
        return articles.count
    }

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

    var title: String {
        return self.article.title
    }

    var description: String {
        return self.article.description
    }
}
