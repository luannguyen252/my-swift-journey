//
//  NetworkImage.swift
//  Devui
//
//  Created by Emilio Schepis on 15/11/20.
//

import SwiftUI
import Combine

struct NetworkImage: View {
    class ViewModel: ObservableObject {
        @Published var image: Image?
        
        private let url: URL
        private let session: URLSession
        private var cancellables = Set<AnyCancellable>()
        
        init(url: URL, session: URLSession = .shared) {
            self.url = url
            self.session = session
            
            loadImage()
        }
        
        func loadImage() {
            session.dataTaskPublisher(for: url)
                .map({ $0.data })
                .compactMap({ UIImage(data: $0) })
                .map({ Image(uiImage: $0) })
                .replaceError(with: nil)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] image in
                    self?.image = image
                }
                .store(in: &cancellables)
        }
    }
    
    @StateObject private var model: ViewModel
    
    init(url: URL) {
        self._model = StateObject(wrappedValue: ViewModel(url: url))
    }
    
    var body: some View {
        if let image = model.image {
            image.resizable()
        } else {
            Rectangle().foregroundColor(.gray)
        }
    }
}
