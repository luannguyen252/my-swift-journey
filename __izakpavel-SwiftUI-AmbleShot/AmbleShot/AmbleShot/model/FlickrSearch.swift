//
//  FlickrSearch.swift
//  AmbleShot
//
//  Created by myf on 01/11/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

//
// f36034673c1743f3
// sample query: https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=b3ed5f78045e00d6d770122978a1bb8a&format=json&geo_context=2&radius=1&lon=15.9392406&lat=49.5626336&geo_context=2&per_page=10
// sample response:
//jsonFlickrApi({"photos":{"page":1,"pages":18,"perpage":10,"total":"175","photo":[{"id":"46547606804","owner":"22982558@N07","secret":"28dafbea5b","server":"7808","farm":8,"title":"Modr\u00e1 hodina\/The blue hour (750.719 \u010cD, \u017d\u010f\u00e1r nad S\u00e1zavou, Sp 1437 \"Pern\u0161tejn\").","ispublic":1,"isfriend":0,"isfamily":0},{"id":"38174547041","owner":"141464170@N04","secret":"14572b9a8c","server":"4463","farm":5,"title":"Lamps After Sunset","ispublic":1,"isfriend":0,"isfamily":0},{"id":"46155887634","owner":"141464170@N04","secret":"84b6d694b4","server":"4848","farm":5,"title":"","ispublic":1,"isfriend":0,"isfamily":0},{"id":"43805818915","owner":"144912669@N02","secret":"1fa9a37870","server":"1898","farm":2,"title":"IMG_20180916_122945","ispublic":1,"isfriend":0,"isfamily":0},{"id":"42904854530","owner":"144912669@N02","secret":"162a314711","server":"1881","farm":2,"title":"IMG_20180916_122942","ispublic":1,"isfriend":0,"isfamily":0},{"id":"29778096007","owner":"144912669@N02","secret":"7a95996b5c","server":"1851","farm":2,"title":"IMG_20180916_122935","ispublic":1,"isfriend":0,"isfamily":0},{"id":"42702552894","owner":"141464170@N04","secret":"2b4be6f348","server":"1781","farm":2,"title":"","ispublic":1,"isfriend":0,"isfamily":0},{"id":"42702551634","owner":"141464170@N04","secret":"92321eeb94","server":"1829","farm":2,"title":"","ispublic":1,"isfriend":0,"isfamily":0},{"id":"29548605958","owner":"141464170@N04","secret":"7e6d68eedd","server":"1828","farm":2,"title":"","ispublic":1,"isfriend":0,"isfamily":0},{"id":"42702549294","owner":"141464170@N04","secret":"42333d9c74","server":"917","farm":1,"title":"","ispublic":1,"isfriend":0,"isfamily":0}]},"stat":"ok"})

// image url: https://farm2.staticflickr.com/1898/43805818915_1fa9a37870.jpg
//  https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg

import Foundation
import Combine
import SwiftUI

enum FlickrError : Error {
    case error(_ error:String)
}


/// response classes

class FlickrResponse : Codable {
    var photos: FlickrPhotos
    var stat: String
    
    func firstPhotoPath() -> String?{
        if let firstPhoto = photos.photo.first {
            return firstPhoto.imagePath()
        }
        return nil
    }
}

class FlickrPhotos : Codable {
    var page: Int
    var pages: Int
    var perpage: Int
    var total: String
    var photo: [FlickrPhoto]
}

class FlickrPhoto : Codable {
    var id: String
    var owner: String
    var secret: String
    var server: String
    var farm: Int
    var title: String
    var ispublic: Int
    var isfriend: Int
    var isfamily: Int
    
    func imagePath()->String {
        let path = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
        return path
    }
}


class FlickrSearch {
    
    static func imagePathFrom(jsonDict: [String:Any]? ) -> String?{
        let farm = jsonDict?["farm"] as? Int
        let id = jsonDict?["id"] as? String
        let secret = jsonDict?["secret"] as? String
        let server = jsonDict?["server"] as? String
        
        if let id=id, let farm=farm, let secret=secret, let server=server {
            let path = "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
            return path
        }
        return nil
    }
    
    static func searchUrl(lng: Double, lat:Double) -> URL?{
        let apiKey = "b3ed5f78045e00d6d770122978a1bb8a"
        let endpoint = "https://api.flickr.com/services/rest"
        let searchMethod = "flickr.photos.search"
        let radius = 0.05
        let perPage = 1
        let geoContext = 2 // outdoors only
        
        if var urlComponents = URLComponents(string: endpoint) {
            urlComponents.query = "method=\(searchMethod)&api_key=\(apiKey)&format=json&geo_context=\(geoContext)&radius=\(radius)&lat=\(lat)&lon=\(lng)&per_page=\(perPage)&nojsoncallback=1"
        
            return urlComponents.url
        }
        return nil
    }
    
    static func locationPhotosDescriptionPublisher(lng: Double, lat: Double) -> AnyPublisher<FlickrResponse, Error>{
        let url = FlickrSearch.searchUrl(lng: lng, lat: lat)
        return URLSession.shared.dataTaskPublisher(for: url!)
                .mapError { $0 as Error }
                .map { $0.data }
                .decode(type: FlickrResponse.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
    }
    
    static func placeImageFilePublisher(urlPath: String?) -> AnyPublisher<String?, Error> {
        if let url = URL(string: urlPath ?? "") {
            return URLSession.shared.dataTaskPublisher(for: url)
                .mapError { $0 as Error }
                .map { $0.data }
                .map {
                    FilesystemHelper.saveDataImage(data: $0, filename: url.lastPathComponent)
                }
                .eraseToAnyPublisher()
        }
        else {
            return Result.Publisher("NONE").eraseToAnyPublisher()
        }
    }
    
    static func locationPhotoPublisher(lng: Double, lat: Double) -> AnyPublisher<String?, Error> {
       return locationPhotosDescriptionPublisher(lng: lng, lat: lat)//-122.02629649, lat: 37.32643691)
            .map {
                if let urlPath = $0.firstPhotoPath() {
                    return urlPath
                }
                return ""
            }
            .flatMap { (urlPath) -> AnyPublisher<String?, Error> in
                return placeImageFilePublisher(urlPath: urlPath)
            }
            .eraseToAnyPublisher()
    }
}
