//
//  Utils.swift
//  Photos
//
//  Created by sergio on 03/04/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import Foundation
import Photos
import Firebase

func URLIntoDocuments(_ component: String) -> URL {
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory,
                                                      in: .userDomainMask).first!
    return documentsDirectory.appendingPathComponent(component)
}

func checkPhotoLibraryPermission() {
    let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
    switch photoAuthorizationStatus {
    case .authorized:
        print("Access already granted")
    case .notDetermined:
        PHPhotoLibrary.requestAuthorization({
            (newStatus) in
            if newStatus == PHAuthorizationStatus.authorized {
                print("Access granted")
            }
        })
    case .restricted:
        print("Access unavailable to user.")
    case .denied:
        // same same
        print("Access denied.")
    @unknown default:
        print("Unrecoverable error: unkwnown PHAuthorizationStatus case")
    }
}

func copyImage(src image: UIImage, name: String) -> URL? {
    
    let fileURL = URLIntoDocuments(name)
    if let data = image.jpegData(compressionQuality:  1.0),
        !FileManager.default.fileExists(atPath: fileURL.path) {
        do {
            try data.write(to: fileURL)
            print("File \(fileURL) copied")
            return fileURL
        } catch {
            print("Error copying file:", error)
        }
    }
    return nil
}

func removeImage(filename: String) {
    let fileURL = URLIntoDocuments(filename)
    if FileManager.default.fileExists(atPath: fileURL.path) {
        try? FileManager.default.removeItem(at: fileURL)
    }
}

func placeholderImage(filename: String) -> UIImage? {
    let fileURL = URLIntoDocuments(filename)
    if FileManager.default.fileExists(atPath: fileURL.path),
        let placeholder = UIImage(contentsOfFile: URLIntoDocuments(filename).path) {
        return  placeholder
    }
    return UIImage(named: "Downloading")
}

extension UIImageView {
    
    func setImage(storageChild: String) {
        let storage = Storage.storage()
        let placeholder = placeholderImage(filename: storageChild)
        print("Trying to download placeholder \(storageChild)")
        self.sd_setImage(with: storage.reference().child(storageChild),
                              placeholderImage: placeholder) { (image, error, type, url) in
        }
    }
}
