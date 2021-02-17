//  Created by Lech Lipnicki on 2021-02-15.
//

import UIKit

final class NewsListTableViewController: UITableViewController {

    private var newsListViewModel: NewsListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true

        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=lt&apiKey=67eede79a9034d2eb397dd0ba3094b12")!

        Webservice().getArticles(url: url) { [weak self] articles in
            if let articles = articles {
                self?.newsListViewModel = NewsListViewModel(articles: articles)

                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        guard let numberOfSections = newsListViewModel?.numberOfSections else {
            return 0
        }
        return numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numberOfRowsInSection = newsListViewModel?.numberOfRowsInSections(section) else {
            return 0
        }
        return numberOfRowsInSection
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ArticleTableViewCell",
            for: indexPath
        ) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleViewModel =  newsListViewModel?.articleAtIndex(indexPath.row)

        cell.titleLabel.text = articleViewModel?.title
        cell.descriptionLabel.text = articleViewModel?.description
        return cell
    }
}
