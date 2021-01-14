//
//  GiphyPlayerView.swift
//  Giphy
//
//  Created by Amir on 26/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import SwiftUI

protocol GiphyPlayerViewDelegate: class {
    func onCloseTouch()
}


struct GiphyPlayerView: View {
    
    // MARK: Properties
    
    @ObservedObject
    var viewModel: GiphyPlayerViewModel
    
    weak var delegate: GiphyPlayerViewDelegate?
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                self.getPlayerView(viewSize: geometry.size)
                VStack(spacing: 5) {
                    Text(self.viewModel.title)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                    Text(self.viewModel.statusText).font(.caption)
                }
                .padding(10)
                Button(action: {
                    self.delegate?.onCloseTouch()
                }, label: {
                    Text(self.viewModel.closeButtonTitle)
                })
            }
        }
    }
    
    
    // MARK: Private functions
    
    func getPlayerView(viewSize: CGSize) -> some View {
        let size = min(viewSize.width, viewSize.height)
        let width = size * 0.7
        return AVPlayerView(sourceURL: viewModel.sourceURL)
            .frame(
                width: width,
                height: width * CGFloat(viewModel.giphyAspectRatio)
            )
            .cornerRadius(20)
    }
}


struct GiphyPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        GiphyPlayerView(viewModel: previewGiphyPlayerViewModel)
    }
}
