//
//  NetworkTarget.swift
//  Movies
//
//  Created by Yagiz Nizipli on 11/1/20.
//

import SwiftUI
import Hover


enum MovieTarget {
  case search(title: String)
}

extension MovieTarget: NetworkTarget {
  var baseURL: URL {
    URL(string: "https://www.omdbapi.com")!
  }
  
  var path: String {
    return "/"
  }
  
  var methodType: MethodType {
    .get
  }
  
  var workType: WorkType {
    switch self {
    case .search(let title):
      return .requestParameters(parameters: ["type": "movie", "s": title, "apikey": "b6a6ffd2"])
    }
  }
  
  var providerType: AuthProviderType {
    .none
  }
  
  var contentType: ContentType? {
    .applicationJson
  }
  
  var headers: [String : String]? {
    nil
  }
}

struct Movie: Codable, Identifiable {
  
  var id: String { imdbID }
  let Title: String
  let Year: String
  let imdbID: String
  let Poster: String
  
  var posterUrl: URL? {
    URL(string: Poster)
  }
}
