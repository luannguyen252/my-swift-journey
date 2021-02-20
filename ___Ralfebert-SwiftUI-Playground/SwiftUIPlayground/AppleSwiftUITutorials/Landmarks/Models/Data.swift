/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 Helpers for loading images and data.
 */

import CoreLocation
import Foundation
import SwiftUI

let landmarkData: [Landmark] = load("landmarkData.json")
let features = landmarkData.filter { $0.isFeatured }
let hikeData: [Hike] = load("hikeData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    private var images: _ImageDictionary = [:]

    fileprivate static var scale = 2

    static var shared = ImageStore()

    func image(name: String) -> Image {
        let index = self._guaranteeImage(name: name)

        return Image(self.images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }

    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
        else {
            fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }

    private func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }

        self.images[name] = ImageStore.loadImage(name: name)
        return self.images.index(forKey: name)!
    }
}
