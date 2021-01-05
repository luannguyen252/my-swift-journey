//
//  PhotoCollectionViewModel.swift
//  PhotoApp
//
//  Created by sergio on 06/04/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class PhotoCollectionViewModel {
    
    let db : Firestore
    let photos : CollectionReference
    let storage : Storage

    static func userQuery() -> (CollectionReference) -> Query {
        return { (_ c : CollectionReference) -> Query in
            return c.whereField("userId", isEqualTo: Auth.auth().currentUser?.uid ?? "NoUser")
        }
    }
    
    static func publicQuery() -> (CollectionReference) -> Query {
        return { (_ c : CollectionReference) -> Query in
            return c.whereField("status", isEqualTo: PhotoStatus.Public.rawValue)
        }
    }
    
    static func anyQuery() -> (CollectionReference) -> Query {
        return { (_ c : CollectionReference) -> Query in
            return c
        }
    }
    
    var baseQuery : Query
    var currentQuery : Query
    var currentTag : String? {
        didSet(value) {
            if let currentTag = currentTag, currentTag != "" {
                self.currentTag = currentTag
                currentQuery = baseQuery.whereField("tags", arrayContains: currentTag)
            } else {
                currentTag = nil
                currentQuery = baseQuery
            }
        }
    }

    init(query: (CollectionReference) -> Query) {
        db = Firestore.firestore()
        let settings = db.settings
        settings.areTimestampsInSnapshotsEnabled = true
        db.settings = settings

        photos = db.collection("photos")
        storage = Storage.storage()
        baseQuery = query(photos)
        currentQuery = baseQuery
    }
    
    func addPhoto(image: UIImage) {
        
        // copy image so we can use it as a placeholder
        let name = NSUUID().uuidString
        if let imageUrl = copyImage(src: image, name: name) {
            self.db.collection("photos").addDocument(data:
                PhotoInfo(uid: "",
                          userId: Auth.auth().currentUser?.uid ?? "NoUser",
                          filename: name,
                          title: "Photo title",
                          description: "",
                          status: .Private,
                          tags: [],
                          likes: []).asDictionary())
            let storageRef = storage.reference().child(name)
            let uploadTask = storageRef.putFile(from: imageUrl, metadata: nil) { metadata, error in
                if let error = error {
                    print("Error while adding photo: \(error)")
                    return
                }
            }
            uploadTask.resume()
        }
    }
    
    func updatePhoto(photo: PhotoInfo) {
        self.db.collection("photos").document(photo.uid).updateData(photo.asDictionary(forKeys:
            ["title", "description", "status", "tags", "likes"]))
    }
    
    func removePhoto(photo: PhotoInfo) {
        self.db.collection("photos").document(photo.uid).delete()
    }

}
