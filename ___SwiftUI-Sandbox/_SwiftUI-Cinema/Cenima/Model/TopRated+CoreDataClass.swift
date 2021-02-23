//
//  TopRated+CoreDataClass.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//
//

import Foundation
import CoreData

@objc(TopRated)
public class TopRated: NSManagedObject, Decodable {
    enum CodingKeys: String, CodingKey {
        case topRatedMovie = "results"
    }
    
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext, let entity = NSEntityDescription.entity(forEntityName: "TopRated", in: context) else {
              throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(entity: entity, insertInto: context)
//        self.init(context: context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        topRatedMovie = try container.decode([CustomObject].self, forKey: .topRatedMovie)

        
       
        
    }
}
