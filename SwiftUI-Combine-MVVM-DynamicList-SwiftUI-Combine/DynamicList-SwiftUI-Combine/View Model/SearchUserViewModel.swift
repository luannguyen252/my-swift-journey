//
//  SearchUserViewModel.swift
//  DynamicList-SwiftUI-Combine
//
//  Created by Farooq Rasheed on 12/01/2020.
//  Copyright © 2020 Farooq Rasheed. All rights reserved.
//

import SwiftUI
import Combine

final class SearchUserViewModel: ObservableObject {

    @Published var name = "farooq94"

    @Published private(set) var users : [User] = []

    @Published private(set) var userImages : [User: UIImage] = [:]

    private var searchCancellable: Cancellable? {
        didSet { oldValue?.cancel() }
    }

    deinit {
        searchCancellable?.cancel()
    }

    func search() {
        guard !name.isEmpty else {
            return users = []
        }

        var urlComponents = URLComponents(string: Constants.baseUrl)!
        urlComponents.queryItems = [
            URLQueryItem(name: "q", value: name)
        ]

        var request = URLRequest(url: urlComponents.url!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        searchCancellable = URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: SearchUserResponse.self, decoder: JSONDecoder())
            .map { $0.items }
            .replaceError(with: [])
            .receive(on: RunLoop.main)
            .assign(to: \.users, on: self)
    }

    func fetchImage(for user: User) {
        guard case .none = userImages[user] else {
            return
        }

        let request = URLRequest(url: user.avatar_url)
        _ = URLSession.shared.dataTaskPublisher(for: request)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: RunLoop.main)
            .sink(receiveValue: { [weak self] image in
                self?.userImages[user] = image
            })
    }
}
