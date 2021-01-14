//
//  DataSource.swift
//  SwiftUICoreData
//
//  Created by Gualtiero Frigerio on 22/08/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import CoreData
import Foundation
import UIKit

struct Artist: Codable {
    var name:String
}

struct Album: Codable {
    var name:String
    var artist:String
}

public class Favourite: NSManagedObject {
    @NSManaged public var album:String
    @NSManaged public var artist:String
}

class DataSource: ObservableObject {
    
    @Published var changed = false
    
    private var albums:[Album] = []
    private var artists:[Artist] = []
    private var managedContext:NSManagedObjectContext?
    
    init() {
        albums = loadAlbumsFromJSON()
        artists = loadArtistsFromJSON()
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            managedContext = appDelegate.persistentContainer.viewContext
        }
    }
    
    func addAlbumToFavourites(album:Album) {
        addRecordToFavourites(album:album.name, artist:album.artist)
    }
    
    func getAlbums() -> [Album] {
        return albums
    }
    
    func getAlbums(forArtist artist:String) -> [Album] {
        return albums.filter {$0.artist == artist}
    }
    
    func getArtists() -> [Artist] {
        return artists
    }
    
    func isAlbumFavourite(album:Album) -> Bool {
        if let _ = fetchRecord(album:album.name, artist:album.artist) {
            return true
        }
        return false
    }
    
    func removeAlbumFromFavourites(album:Album) {
        removeRecordFromFavourites(album:album.name, artist:album.artist)
    }
    
    func toggleFavourite(album:Album) {
        if isAlbumFavourite(album: album) {
            removeAlbumFromFavourites(album: album)
        }
        else {
            addAlbumToFavourites(album: album)
        }
    }
}

// MARK: Class functions

extension DataSource {
    class func fetchAllFavourites() -> NSFetchRequest<Favourite> {
        let request = NSFetchRequest<Favourite>(entityName: "Favourite")
        request.sortDescriptors = [NSSortDescriptor(key: "album", ascending: true)]
        return request
    }
}

// MARK: Private functions

extension DataSource {
    
    private func addRecordToFavourites(album:String, artist:String) {
        guard let context = managedContext else {return}
        if let record = fetchRecord(album:album, artist:artist) {
            print("record \(record) already exists")
            return
        }
        
        let entity = NSEntityDescription.entity(forEntityName: "Favourite",
                                                in: context)!
        let favourite = NSManagedObject(entity:entity, insertInto:context)
        favourite.setValue(album, forKeyPath:"album")
        favourite.setValue(artist, forKeyPath:"artist")
        
        do {
          try context.save()
        }
        catch let error as NSError {
          print("Could not save. \(error), \(error.userInfo)")
        }
        self.changed = true
    }
    
    private func fetchRecord(album:String, artist:String) -> Favourite? {
        guard let context = managedContext else {return nil}
        
        let request = NSFetchRequest<Favourite>(entityName: "Favourite")
        request.predicate = NSPredicate(format: "album == %@ and artist == %@", album, artist)
        
        if let users = try? context.fetch(request) {
            if users.count > 0 {
                return users[0]
            }
        }
        return nil
    }
    
    private func loadAlbumsFromJSON() -> [Album] {
        var albums:[Album] = []
        if let url = Bundle.main.url(forResource: "albums", withExtension: "json") {
            guard let data = try? Data(contentsOf: url) else {
                return albums
            }
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Album].self, from: data)  {
                albums = decodedData
            }
        }
        return albums
    }
    
    private func loadArtistsFromJSON() -> [Artist] {
        var artists:[Artist] = []
        if let url = Bundle.main.url(forResource: "artists", withExtension: "json") {
            guard let data = try? Data(contentsOf: url) else {
                return artists
            }
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Artist].self, from: data)  {
                artists = decodedData
            }
        }
        return artists
    }
    
    private func removeRecordFromFavourites(album:String, artist:String) {
        guard let context = managedContext else {return}
        if let record = fetchRecord(album:album, artist:artist) {
            context.delete(record)
            self.changed = true
        }
    }
}
