//
//  Upcoming+CoreDataClass.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//
//

import Foundation
import CoreData

@objc(Upcoming)
public class Upcoming: NSManagedObject, Decodable{

    
    enum CodingKeys: String, CodingKey {
        case upcomingMovie = "results"
    }
    
    required convenience public init(from decoder: Decoder) throws {
        
        guard let context = decoder.userInfo[CodingUserInfoKey.managedObjectContext] as? NSManagedObjectContext, let entity = NSEntityDescription.entity(forEntityName: "Upcoming", in: context) else {
              throw DecoderConfigurationError.missingManagedObjectContext
        }
        
        self.init(entity: entity, insertInto: context)
//        self.init(context: context)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        upcomingMovie = try container.decode([CustomObject].self, forKey: .upcomingMovie)

        
       
        
    }


}
