//
//  GiphyGalleryViewModel.swift
//  Giphy
//
//  Created by Amir on 26/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation
import Combine

class GiphyGalleryViewModel: ObservableObject {
    
    // MARK: Properties
    
    @Published var items: [Giphy] = []
    
    private let fileRepository: FileRepository
    private let giphyRepository: GiphyRepository
    private var cancelableSet: Set<AnyCancellable> = Set()

    deinit {
        cancelableSet.forEach {
            $0.cancel()
        }
    }
    
    // MARK: Lifecycle
    
    init(items: [Giphy] = [], fileRepository: FileRepository, giphyRepository: GiphyRepository) {
        self.items = items
        self.fileRepository = fileRepository
        self.giphyRepository = giphyRepository
        sinkToGiphyList()
        giphyRepository.fetchMoreGiphy()
    }
    
    
    // MARK: Public functions
    
    func getNewImageLoader() -> ImageLoader<GiphyRepository> {
        ImageLoader(downloader: giphyRepository, fileRepository: fileRepository)
    }
    
    func fetchNextPageIfNeeded(_ giphy: Giphy) {
        if items.firstIndex(where: { $0.id == giphy.id }) == items.count - 1 {
            giphyRepository.fetchMoreGiphy()
        }
    }
    
    
    // MARK: Private functions
    
    func sinkToGiphyList() {
        giphyRepository.giphyListPublisher
            .sink { newItems in
                DispatchQueue.main.async { [weak self] in
                    self?.items = newItems
                }
            }
            .store(in: &cancelableSet)
    }
    
}


#if DEBUG
fileprivate let videoURL = URL(string: "https://media2.giphy.com/media/Z4Sek3StLGVO0/giphy.mp4?cid=e1bb72ff90eb82496e27e9fd9cfc79eb988fa45fa06678d1&rid=giphy.mp4")!
let previewGiphyGalleryViewModel = GiphyGalleryViewModel(
    items: [
        Giphy(giphyId: "1", title: "first", videoURL: videoURL, previewImageURL: URL(string: "https://media.giphy.com/media/l4dqF0Aw5S8xXKHP5j/giphy.gif")!),
        Giphy(giphyId: "2", title: "second", videoURL: videoURL, previewImageURL: URL(string: "https://media.giphy.com/media/YnBntKOgnUSBkV7bQH/giphy.gif")!),
        Giphy(giphyId: "3", title: "third", videoURL: videoURL, previewImageURL: URL(string: "https://media.giphy.com/media/Kenaq5YK78qy5flMCf/giphy.gif")!)
    ],
    fileRepository: FileRepository(),
    giphyRepository: GiphyRepository(webAPI: WebAPI())
)
#endif
