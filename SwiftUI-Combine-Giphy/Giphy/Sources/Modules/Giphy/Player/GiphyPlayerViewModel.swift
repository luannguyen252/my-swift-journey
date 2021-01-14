//
//  GiphyPlayerViewModel.swift
//  Giphy
//
//  Created by Amir on 26/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation
import Combine
import UIKit

class GiphyPlayerViewModel: ObservableObject {
    
    // MARK: Constants
    
    private enum Status {
        case none
        case downloading
        case failed(Int)
        case schedulingNext(Int)
    }
    
    private struct Constants {
        static let nextGiphyInterval = 10
        static let retryDelay = 5
    }
    
    
    // MARK: Properties
    
    let closeButtonTitle: String = NSLocalizedString("GIPHY_CLOSE_BUTTON_TITLE", comment: "")
    @Published var statusText: String = ""
    @Published var sourceURL: URL? = nil
    var title: String {
        giphy?.title ?? ""
    }
    var giphyAspectRatio: Float {
        Float(giphy?.height ?? 1) / Float(giphy?.width ?? 1)
    }
    
    private var status: Status = .none {
        didSet {
            updateStatusText()
        }
    }
    
    private let fileRepository: FileRepository
    private let giphyRepository: GiphyRepository
    private var giphy: Giphy?
    private var nextGiphy: Giphy?
    private var cancelableSet: Set<AnyCancellable> = Set()
    private var timer: Timer?
    
    
    // MARK: Lifecycle
    
    init(giphy: Giphy, fileRepository: FileRepository, giphyRepository: GiphyRepository) {
        self.fileRepository = fileRepository
        self.giphyRepository = giphyRepository
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.onTimerPulse()
        }
        self.nextGiphy = giphy
        downloadGiphy(giphy)
    }
    
    deinit {
        timer?.invalidate()
    }
    
    
    // MARK: Private functions
    
    private func downloadGiphy(_ giphy: Giphy) {
        let url = fileRepository.cacheBaseURL.appendingPathComponent("giphy\(giphy.id).mp4")
        status = .downloading
        giphyRepository.downloadGiphy(giphy)
            .mapError { $0 as Error }
            .flatMap {
                self.fileRepository.writeAsync($0, to: url)
            }
            .flatMap {
                self.giphyRepository.fetchRandomGiphy()
            }
            .sink(receiveCompletion: { [weak self] result in
                if case .failure(let error) = result {
                    print(error)
                    self?.status = .failed(Constants.retryDelay)
                }
            }, receiveValue: { [weak self] nextGiphy in
                self?.scheduleNextGiphy(nextGiphy)
                DispatchQueue.main.async { [weak self] in
                    self?.giphy = giphy
                    self?.sourceURL = url
                }
            })
            .store(in: &cancelableSet)
    }
    
    private func scheduleNextGiphy(_ giphy: Giphy) {
        nextGiphy = giphy
        status = .schedulingNext(Constants.nextGiphyInterval)
    }
    
    private func updateStatusText() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            switch self.status {
            case .failed(let seconds):
                self.statusText = String(format: NSLocalizedString("GIPHY_FAILED_TO_DOWNLOAD_RETRYING", comment: ""), seconds)
            case .downloading:
                self.statusText = NSLocalizedString("GIPHY_DOWNLOADING", comment: "")
            case .schedulingNext(let seconds):
                self.statusText = String(format: NSLocalizedString("GIPHY_RANDOM_INTERVAL", comment: ""), seconds)
            case .none:
                return
            }
        }
    }
    
    private func onTimerPulse() {
        if case .schedulingNext(let seconds) = status {
            if seconds > 1 {
                status = .schedulingNext(seconds - 1)
            } else if let nextGiphy = nextGiphy {
                downloadGiphy(nextGiphy)
            }
        }
        if case .failed(let seconds) = status {
            if seconds > 1 {
                status = .failed(seconds - 1)
            } else if let nextGiphy = nextGiphy {
                downloadGiphy(nextGiphy)
            }
        }
    }
    
}


#if DEBUG
let previewGiphyPlayerViewModel = GiphyPlayerViewModel(
    giphy: previewGiphyGalleryViewModel.items.first!,
    fileRepository: FileRepository(),
    giphyRepository: GiphyRepository(webAPI: WebAPI())
)
#endif
