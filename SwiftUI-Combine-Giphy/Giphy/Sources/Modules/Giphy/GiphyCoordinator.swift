//
//  GiphyCoordinator.swift
//  Giphy
//
//  Created by Amir on 26/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import UIKit
import SwiftUI

class GiphyCoordinator: Coordinator {

    // MARK: Properties
    
    private(set) var galleryController: UIViewController?
    private weak var playerController: UIViewController?
    private let fileRepository: FileRepository
    private let giphyRepository: GiphyRepository
    
    
    // MARK: Lifecycle
    
    init(fileRepository: FileRepository, giphyRepository: GiphyRepository) {
        self.fileRepository = fileRepository
        self.giphyRepository = giphyRepository
    }
    
    
    // MARK: Public functions
    
    func start() {
        let viewModel = GiphyGalleryViewModel(
            fileRepository: fileRepository,
            giphyRepository: giphyRepository
        )
        let view = GiphyGalleryView(viewModel: viewModel, delegate: self)
        galleryController = UIHostingController(rootView: view)
    }
    
    
    // MARK: Private functions
    
    private func showPlayer(giphy: Giphy) {
        let viewModel = GiphyPlayerViewModel(giphy: giphy, fileRepository: fileRepository, giphyRepository: giphyRepository)
        let view = GiphyPlayerView(viewModel: viewModel, delegate: self)
        let playerController = UIHostingController(rootView: view)
        galleryController?.present(playerController, animated: true)
        self.playerController = playerController
    }
    
    private func dismissPlayer() {
        playerController?.dismiss(animated: true)
    }
    
}


extension GiphyCoordinator: GiphyGalleryViewDelegate {
    
    func onTouch(giphy: Giphy) {
        showPlayer(giphy: giphy)
    }
    
}


extension GiphyCoordinator: GiphyPlayerViewDelegate {
    
    func onCloseTouch() {
        dismissPlayer()
    }
    
}
