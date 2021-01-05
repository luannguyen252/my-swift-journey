//
//  PhotoCollectionViewModel.swift
//  PhotoApp
//
//  Created by sergio on 06/04/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import Foundation
import UIKit

class PhotoCollectionViewModel {
    
    var photoStore : OpaquePointer!
    
    var currentPhotos : [Int32] = []
    var currentTag : String? {
        didSet(value) {
            if let currentTag = currentTag, currentTag != "" {
                currentPhotos = lookup(db: photoStore, tag: currentTag)
            } else {
                currentTag = nil
                currentPhotos = []
            }
        }
    }
    
    init() {
        let fileURL = try! FileManager.default.url(for: .documentDirectory,
                                                   in: .userDomainMask,
                                                   appropriateFor: nil,
                                                   create: false)
            .appendingPathComponent("PhotoStore.sqlite")
        
        photoStore = create(store: fileURL)
        createTable(db: photoStore)
    }
    
    deinit {
        close(db: photoStore)
    }
    
    func photoCount() -> Int {
        if currentTag != nil {
            return currentPhotos.count
        }
        return Int(count(db: photoStore))
    }

    func photo(index: Int) -> PhotoInfo {
        var modelIndex = Int32(index)
        if currentTag != nil {
            modelIndex = currentPhotos[index - 1]
        }
        return lookup(db: photoStore, uid: modelIndex)
    }

    func addPhoto(image: UIImage) {
        
        let name = NSUUID().uuidString
        if copyImage(src: image, name: name) != nil {
            let photoInfo = PhotoInfo(uid: 0, filename: name,
                                      title: "Photo title", description: "", tags: "")
            insert(db: photoStore, photoInfo)
        }
    }
}
