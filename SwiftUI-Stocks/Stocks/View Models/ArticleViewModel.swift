//
//  File.swift
//  Stocks
//
//  Created by Juan Francisco Dorado Torres on 25/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

struct ArticleViewModel {
  let article: Article

  var imageURL: String {
    return article.imageURL
  }

  var title: String {
    return article.title
  }

  var publication: String {
    return article.publication.uppercased()
  }
}
