//
//  APIHelper.swift
//  CityExplorer
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

let apiKey = "85c816c994a81fd8c92027c0dd2b5919"

func generateFlickrURL(latitude: Double, longitude: Double, numberOfPhotos: Int) -> String {
    let url = "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(apiKey)&lat=\(latitude)&lon=\(longitude)&radius=1&radius_units=km&per_page=\(numberOfPhotos)&format=json&nojsoncallback=1"
    return url
}
