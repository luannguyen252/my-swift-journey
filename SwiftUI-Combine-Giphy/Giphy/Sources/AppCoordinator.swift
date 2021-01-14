//
//  AppCoordinator.swift
//  Giphy
//
//  Created by Amir on 26/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import UIKit
import SwiftUI

class AppCoordinator: Coordinator {

    // MARK: Properties
    
    private let window: UIWindow
    private var giphyCoordinator: GiphyCoordinator?
    private let webAPI: WebAPI
    private let fileRepository: FileRepository
    private let giphyRepository: GiphyRepository
    
    
    // MARK: Lifecycle
    
    init(window: UIWindow) {
        self.window = window
        self.webAPI = WebAPI()
        self.fileRepository = FileRepository()
        self.giphyRepository = GiphyRepository(webAPI: webAPI)
    }
    
    
    // MARK: Public functions
    
    func start() {
        giphyCoordinator = GiphyCoordinator(fileRepository: fileRepository, giphyRepository: giphyRepository)
        giphyCoordinator?.start()
        window.rootViewController = giphyCoordinator?.galleryController
        window.makeKeyAndVisible()
    }
}
