//
//  ImageLoader.swift
//  Giphy
//
//  Created by Amir on 27/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import UIKit.UIImage
import SwiftUI
import Combine

class ImageLoader<T: ImageDownloader>: ObservableObject {
    
    // MARK: Properties
    
    var objectWillChange = PassthroughSubject<ImageLoader, Never>()
    private let downloader: T
    private let fileRepository: FileRepository
    private let dispatchQueue: DispatchQueue
    private var cancelableSet: Set<AnyCancellable> = Set()
    private var image: UIImage? {
        didSet {
            dispatchQueue.async { [weak self] in
                guard let self = self else { return }
                self.objectWillChange.send(self)
            }
        }
    }
    
    
    // MARK: Lifecycle
    
    init(downloader: T, fileRepository: FileRepository, dispatchQueue: DispatchQueue = .main) {
        self.downloader = downloader
        self.fileRepository = fileRepository
        self.dispatchQueue = dispatchQueue
    }
    
    deinit {
        cancelableSet.forEach {
            $0.cancel()
        }
    }
    
    
    // MARK: Public functions
    
    func image(for object: T.ObjectType?, placeHolder: UIImage) -> UIImage {
        if let image = image {
            return image
        }
        if let object = object {
            loadImage(object: object)
        }
        return placeHolder
    }
    
    
    // MARK: Private functions
    
    private func loadImage(object: T.ObjectType) {
        let key = object.cacheKey
        if isCached(key: key) {
            loadImageFromCache(key: key)
        } else {
            downloader.downloadImage(for: object)
                .sink(receiveCompletion: { result in
                    if case .failure(let error) = result {
                        print(error)
                    }
                }, receiveValue: { [weak self] data in
                    self?.cacheImage(key: key, data: data)
                    let image = UIImage(data: data)
                    self?.image = image
                })
                .store(in: &cancelableSet)
        }
    }
    
    private func cacheImage(key: String, data: Data) {
        let url = fileRepository.imagesCacheBaseURL.appendingPathComponent(key)
        fileRepository
            .writeAsync(data, to: url)
            .sink(receiveCompletion: { result in
                if case .failure(let error) = result {
                    print(error)
                }
            }, receiveValue: { _ in
                print("image cached: \(key)")
            })
            .store(in: &cancelableSet)
    }
    
    private func isCached(key: String) -> Bool {
        let url = fileRepository.imagesCacheBaseURL.appendingPathComponent(key)
        return fileRepository.exists(in: url)
    }
    
    private func loadImageFromCache(key: String) {
        let url = fileRepository.imagesCacheBaseURL.appendingPathComponent(key)
        fileRepository
            .readAsync(from: url)
            .sink(receiveCompletion: { result in
                if case .failure(let error) = result {
                    print(error)
                }
            }, receiveValue: { [weak self] data in
                self?.image = UIImage(data: data)
            })
            .store(in: &cancelableSet)
    }
    
}
