//  Created by Lech Lipnicki on 2021-02-15.
//

import UIKit

final class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationController?.navigationBar.prefersLargeTitles = true

        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=lt&apiKey=67eede79a9034d2eb397dd0ba3094b12")!
        Webservice().getArticles(url: <#T##URL#>, completion: <#T##([Any]?) -> ()#>)
    }
}
