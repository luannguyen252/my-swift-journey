//
//  RemoteImageUrl.swift
//  MVVMApp4
//
//  Created by Luan Nguyen on 04/01/2021.
//

import SwiftUI

class RemoteImageUrl: ObservableObject {
    @Published var data = Data()
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                self.data = data
            }
        }
        .resume()
    }
}
