//
//  DownloadManager.swift
//  CityExplorer
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI
import Alamofire
import AlamofireImage

class DownloadManager: ObservableObject {
    // MARK - PROPERTIES
    @Published var percentLoaded = 0.0
    @Published var imagesFetched = false
    
    // Image url
    var imageURLs = [String]()
    
    // Image downloaded
    var downloadedImages = [DownloadedImage]()
    
    // Start download image
    func startDownload(flickrURL: String) {
        print("Started fetching images from Flickr.")
        
        retrieveImageURLS(fromFlickrURL: flickrURL) { (finished) in
            if finished {
                print("All image URLs retrieved.")
                self.retrieveImages { (finished) in
                    if finished {
                        print("All images succesfully downloaded.")
                        self.imagesFetched = true
                    }
                }
            }
        }
    }
    
    // Retrieve image urls
    func retrieveImageURLS(fromFlickrURL: String, handler: @escaping (_ status: Bool) -> ()) {
        AF.request(fromFlickrURL).responseJSON { (response) in
            switch response.result {
            case let .success(value):
                if let json = value as? Dictionary<String, AnyObject> {
                    let motherPhotosDict = json["photos"] as! Dictionary<String, AnyObject>
                    let photoDicts = motherPhotosDict["photo"] as! [Dictionary<String, AnyObject>]
                    for photo in photoDicts {
                        let photoURL = "https://farm\(photo["farm"]!).staticflickr.com/\(photo["server"]!)/\(photo["id"]!)_\(photo["secret"]!)_b.jpg"
                        self.imageURLs.append(photoURL)
                    }
                    handler(true)
                }
            case let .failure(error):
                print("Json could not be created.", error)
            }
        }
        
    }
    
    // Retrieve images
    func retrieveImages(handler: @escaping(_ status: Bool) -> ()) {
        guard !imageURLs.isEmpty else { return handler(true) }
        
        for url in imageURLs {
            AF.request(url).responseImage { (response) in
                switch response.result {
                case let .success(retrievedImage):
                    self.downloadedImages.append(DownloadedImage(image: retrievedImage))
                    withAnimation() {
                        self.percentLoaded = Double(self.downloadedImages.count)/Double(self.imageURLs.count)
                    }
                    print("\(self.downloadedImages.count)/\(self.imageURLs.count) images downloaded.")
                    if self.downloadedImages.count == self.imageURLs.count {
                        handler(true)
                    }
                case let .failure(error):
                    print("Image could not be fetched from \(url).", error)
                }
            }
        }
    }
    
    // Clean image url, download images and percent loaded
    func clean() {
        imageURLs.removeAll()
        downloadedImages.removeAll()
        percentLoaded = 0.0
    }
}
