//
//  GiphyRepository.swift
//  Giphy
//
//  Created by Amir on 27/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation
import Combine

class GiphyRepository {
    
    // MARK: Constants
    
    private struct Constants {
        static let pageSize = 25
    }
    
    
    // MARK: Properties
    
    var giphyList: [Giphy] {
        giphyListSubject.value
    }
    
    var giphyListPublisher: AnyPublisher<[Giphy], Never> {
        giphyListSubject.eraseToAnyPublisher()
    }
    
    private let webAPI: WebAPI
    private let giphyListSubject = CurrentValueSubject<[Giphy], Never>([])
    private var offset = 0
    private var totalCount: Int?
    private var fetching = false
    private var cancelableSet: Set<AnyCancellable> = Set()
    
    
    // MARK: Lifecycle
    
    init(webAPI: WebAPI) {
        self.webAPI = webAPI
    }
    
    deinit {
        cancelableSet.forEach {
            $0.cancel()
        }
    }
    
    
    // MARK: Public functions
    
    func fetchMoreGiphy() {
        guard !fetching, offset < totalCount ?? 1 else {
            return
        }
        fetching = true
        let publisher: AnyPublisher<WebAPI.GiphyList, Error> = webAPI.request(endPoint: WebAPI.GiphyEndpoint.trending(Constants.pageSize, offset))
        publisher
            .sink(receiveCompletion: { [weak self] result in
                self?.fetching = false
                if case .failure(let error) = result {
                    print("Failed to fetch giphy trending list: \(error.localizedDescription)")
                }
                }, receiveValue: { [weak self] in
                    self?.processTrendingAPIResponse($0)
            })
            .store(in: &cancelableSet)
    }
    
    func fetchRandomGiphy() -> AnyPublisher<Giphy, Error> {
        let publisher: AnyPublisher<WebAPI.GiphyRandom, Error> = webAPI.request(endPoint: WebAPI.GiphyEndpoint.random)
        return publisher
            .compactMap { [weak self] in
                self?.makeGiphyFromResponse($0.data)
            }
            .eraseToAnyPublisher()
    }
    
    
    func downloadGiphy(_ giphy: Giphy) -> AnyPublisher<Data, URLError> {
        webAPI.downloadPublicData(url: giphy.videoURL)
    }
    
    
    // MARK: Private functions
    
    private func processTrendingAPIResponse(_ response: WebAPI.GiphyList) {
        var list = giphyListSubject.value
        offset = response.pagination.count + response.pagination.offset
        totalCount = response.pagination.totalCount
        let newItems = response.data.compactMap { item -> Giphy? in
            guard let previewImageURL = URL(string: item.images.preview.url),
                let videoURLString = item.images.original.mp4,
                let videoURL = URL(string: videoURLString) else {
                    return nil
            }
            return Giphy(
                giphyId: item.id,
                title: item.title,
                videoURL: videoURL,
                previewImageURL: previewImageURL,
                width: Int(item.images.original.width),
                height: Int(item.images.original.height)
            )
        }
        list.append(contentsOf: newItems)
        giphyListSubject.send(list)
    }
    
    private func makeGiphyFromResponse(_ item: WebAPI.Giphy) -> Giphy? {
        guard let previewImageURL = URL(string: item.images.preview.url),
            let videoURLString = item.images.original.mp4,
            let videoURL = URL(string: videoURLString) else {
                return nil
        }
        return Giphy(
            giphyId: item.id,
            title: item.title,
            videoURL: videoURL,
            previewImageURL: previewImageURL,
            width: Int(item.images.original.width),
            height: Int(item.images.original.height)
        )
    }
    
}


extension GiphyRepository: ImageDownloader {
    
    func downloadImage(for giphy: Giphy) -> AnyPublisher<Data, URLError> {
        webAPI.downloadPublicData(url: giphy.previewImageURL)
    }
    
}

