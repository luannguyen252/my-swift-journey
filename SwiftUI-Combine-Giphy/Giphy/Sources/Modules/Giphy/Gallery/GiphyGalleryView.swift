//
//  GalleryCollectionView.swift
//  Giphy
//
//  Created by Amir on 26/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import SwiftUI

protocol GiphyGalleryViewDelegate: class {
    func onTouch(giphy: Giphy)
}

struct GiphyGalleryView: View {
    
    // MARK: Properties
    
    @ObservedObject var viewModel: GiphyGalleryViewModel
    
    weak var delegate: GiphyGalleryViewDelegate?
    
    var body: some View {
        return List(viewModel.items) { giphy in
            GiphyGalleryViewRow(
                imageLoader: self.viewModel.getNewImageLoader(),
                giphy: giphy
            )
            .onTapGesture {
                self.delegate?.onTouch(giphy: giphy)
            }
            .onAppear {
               self.viewModel.fetchNextPageIfNeeded(giphy)
            }
        }
    }
    
}


struct GiphyGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        return GiphyGalleryView(viewModel: previewGiphyGalleryViewModel)
    }
}
