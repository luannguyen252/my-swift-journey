//
//  GiphyGalleryRow.swift
//  Giphy
//
//  Created by Amir on 26/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//
import SwiftUI

struct GiphyGalleryViewRow: View {
    
    // MARK: Properties
    
    @ObservedObject var imageLoader: ImageLoader<GiphyRepository>
    
    var giphy: Giphy
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                Image(uiImage: uiImage)
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                Text(giphy.title)
                    .font(.caption)
                    .lineLimit(3)
            }
            
        }
        .frame(maxHeight: 100)
    }
}


extension GiphyGalleryViewRow {
    
    var uiImage: UIImage {
        imageLoader.image(
            for: giphy,
            placeHolder: UIImage(named: "GiphyPlaceholder")!
        )
    }
}


struct GiphyGalleryViewRow_Previews: PreviewProvider {
    static var previews: some View {
        GiphyGalleryViewRow(
            imageLoader: previewGiphyGalleryViewModel.getNewImageLoader(),
            giphy: previewGiphyGalleryViewModel.items.first!
        )
    }
}
