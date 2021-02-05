//
//  ImageSaver.swift
//  Instafilter
//
//  Created by Sandesh on 20/11/20.
//

import UIKit

class ImageSaver: NSObject {
    
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contexr: UnsafeRawPointer) {
        if let error  = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
