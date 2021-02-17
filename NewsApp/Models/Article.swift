//  Created by Lech Lipnicki on 2021-02-15.
//

import Foundation

struct NewsList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
