//
//  NowPlaying+CoreDataProperties.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//
//

import Foundation
import CoreData


extension NowPlaying {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NowPlaying> {
        return NSFetchRequest<NowPlaying>(entityName: "NowPlaying")
    }

    @NSManaged public var nowPlayingMovie: [CustomObject]?
    @NSManaged public var timeStamp: Date?

}

extension NowPlaying : Identifiable {

}
