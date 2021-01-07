//
//  StockService.swift
//  Stocks
//
//  Created by Juan Francisco Dorado Torres on 25/08/20.
//  Copyright © 2020 Juan Francisco Dorado Torres. All rights reserved.
//

import Foundation

enum StockServiceError: String, Error {
  case unableToComplete = "Unable to complete your request. Please check your internet connection."
  case invalidResponse = "Invalid response from the server. Please try again."
  case invalidData = "The data received from the server was invalid. Please try again."
  case unableToParse = "The data received is unable to parse, please check the models match!"
}

class StockService {
  static func getTopNews(_ completion: @escaping (Result<[Article], StockServiceError>) -> Void) {
    guard let url = URL(string: "https://island-bramble.glitch.me/top-news") else {
      fatalError("URL is not correct")
    }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        completion(.failure(.unableToComplete))
        return
      }

      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completion(.failure(.invalidResponse))
        return
      }

      guard let data = data else {
        completion(.failure(.invalidData))
        return
      }

      do {
        let decoder = JSONDecoder()
        let articlesResponse = try decoder.decode([Article].self, from: data)
        completion(.success(articlesResponse))
      } catch {
        completion(.failure(.unableToParse))
      }
    }.resume()
  }

  static func getStocks(_ completion: @escaping (Result<[Stock], StockServiceError>) -> Void) {
    guard let url = URL(string: "https://island-bramble.glitch.me/stocks") else {
      fatalError("URL is not correct")
    }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        completion(.failure(.unableToComplete))
        return
      }

      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completion(.failure(.invalidResponse))
        return
      }

      guard let data = data else {
        completion(.failure(.invalidData))
        return
      }

      do {
        let decoder = JSONDecoder()
        let articlesResponse = try decoder.decode([Stock].self, from: data)
        completion(.success(articlesResponse))
      } catch {
        completion(.failure(.unableToParse))
      }
    }.resume()
  }
}
