//
//  PhotoGrid.swift
//  CityExplorer
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct PhotoGrid: View {
    // MARK: - PROPERTIES
    var latitudeToSearchFor: Double
    var longitudeToSearchFor: Double
    @StateObject var downloadManager = DownloadManager()
    
    // MARK: - BODY
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if downloadManager.imagesFetched && downloadManager.downloadedImages.isEmpty {
                    Image(systemName: "questionmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width/12, height: geometry.size.width/8)
                    
                    Text("No photos found at this location ):")
                        .padding()
                } else if downloadManager.imagesFetched {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(spacing: 0), GridItem(spacing: 0)], spacing: 0) {
                            ForEach(downloadManager.downloadedImages) { downloadedImage in
                                GridCell(image: downloadedImage.image, width: geometry.size.width/2, height: geometry.size.width/2)
                            }
                        } //: LAZYVGRID
                    } //: SCROLLVIEW
                } else {
                    Spacer()
                    
                    ProgressView(value: downloadManager.percentLoaded)
                        .progressViewStyle(DarkBlueShadowProgressViewStyle())
                    
                    Spacer()
                }
            } //: VSTACK
        } //: GEOMETRY READER
        .onAppear(perform: {
            downloadManager.startDownload(flickrURL: generateFlickrURL(latitude: latitudeToSearchFor, longitude: longitudeToSearchFor, numberOfPhotos: 40))
        })
        .onDisappear(perform: {
            downloadManager.clean()
        })
    }
}

// MARK: - PREVIEW
#if DEBUG
struct PhotoGrid_Previews: PreviewProvider {
    static var previews: some View {
        PhotoGrid(latitudeToSearchFor: 48.864716, longitudeToSearchFor: 2.349014)
    }
}
#endif

// MARK: - DARK BLUE SHADOW PROGRESS VIEW
struct DarkBlueShadowProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ProgressView(configuration)
            .shadow(color: Color(red: 0, green: 0, blue: 0.6), radius: 4.0, x: 1.0, y: 2.0)
            .padding()
    }
}

// MARK: - GRID CELL
struct GridCell: View {
    // MARK: - PROPERTIES
    let image: UIImage
    let width, height: CGFloat
    
    // MARK: - BODY
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .clipped()
    }
}
