//
//  Album.swift
//  APICall-SwiftUI
//
//  Created by Keerthi on 27/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import Foundation

struct Album : Codable, Identifiable {

        let albumId : Int?
        let id : Int?
        let thumbnailUrl : String?
        let title : String?
        let url : String?

        enum CodingKeys: String, CodingKey {
                case albumId = "albumId"
                case id = "id"
                case thumbnailUrl = "thumbnailUrl"
                case title = "title"
                case url = "url"
        }
    
        init(from decoder: Decoder) throws {
                let values = try decoder.container(keyedBy: CodingKeys.self)
                albumId = try values.decodeIfPresent(Int.self, forKey: .albumId)
                id = try values.decodeIfPresent(Int.self, forKey: .id)
                thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
                title = try values.decodeIfPresent(String.self, forKey: .title)
                url = try values.decodeIfPresent(String.self, forKey: .url)
        }

}
