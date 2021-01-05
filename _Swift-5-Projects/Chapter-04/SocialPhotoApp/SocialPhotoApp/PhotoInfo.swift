//
//  PhotoInfo.swift
//  Photo2
//
//  Created by sergio on 31/03/2019.
//  Copyright © 2019 Sergio De Simone. All rights reserved.
//

import Foundation

enum PhotoStatus : String {
    case Public = "public"
    case Private = "private"
}

struct PhotoInfo {
    let uid: String
    let userId: String
    let filename: String
    let title: String
    let description: String
    let status : PhotoStatus
    let tags: [String]
    var likes: [String]
    
    static func makeStatus(_ s: Any?) -> PhotoStatus {
        return (s as? String == "public" || s as? Bool == true) ? .Public : .Private
    }

    static func makeTags(_ s: Any?) -> [String] {
        return (s as? String)?.components(separatedBy: CharacterSet(charactersIn: ",")) ?? []
    }
    

    init(uid: String,
         userId: String,
         filename: String,
         title: String,
         description: String,
         status: PhotoStatus,
         tags: [String],
         likes: [String]) {
        
        self.uid = uid
        self.userId = userId
        self.filename = filename
        self.title = title
        self.description = description
        self.status = status
        self.tags = tags
        self.likes = likes
    }

    init(uid: String = "", data: [String : Any] = [:]) {
        
        self.init(uid: uid,
                  userId: data["userId"] as? String ?? "NoUser",
                  filename: data["filename"] as? String ?? "",
                  title: data["title"] as? String ?? "",
                  description: data["description"] as? String ?? "",
                  status: PhotoInfo.makeStatus(data["status"]),
                  tags: data["tags"] as? [String] ?? PhotoInfo.makeTags(data["tags"]),
                  likes: data["likes"] as? [String] ?? [])
    }

    func asDictionary(forKeys: [String] = []) -> [String : Any] {
        let mirror = Mirror(reflecting: self)
        return Dictionary(uniqueKeysWithValues:
            mirror.children.lazy.map({ (key: String?, value: Any) -> (String, Any)? in
                guard let key = key else { return nil }
                if let value = value as? PhotoStatus {
                    return (key, value.rawValue)
                }
                return (key, value)
            }).compactMap{ $0 }).filter { (tuple) -> Bool in
                let (key, _) = tuple
                return (forKeys.count == 0 && key != "uid") || forKeys.contains(key)
        }
    }
}
