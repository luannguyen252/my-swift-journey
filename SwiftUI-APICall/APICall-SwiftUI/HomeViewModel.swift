//
//  HomeViewModel.swift
//  APICall-SwiftUI
//
//  Created by Keerthi on 27/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    private let providerProtocol: RequestProviderProtocol!
    
    @Published var albums = [Album]()

    init(provider: RequestProviderProtocol) {
        self.providerProtocol = provider
    }
    
    func getAlbumList() {
        let parameters = [String: AnyObject]()
        
        providerProtocol.request(type: [Album].self, service: Request.getPhotos(parameters: parameters)) { (response) in
            switch response {
            case .success(let result):
                DispatchQueue.main.async {
                    
                    self.albums = result
                }
            case .failure:
                break
            }
        }
    }
}

