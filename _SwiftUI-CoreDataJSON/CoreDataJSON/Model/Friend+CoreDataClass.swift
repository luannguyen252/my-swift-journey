//
//  Friend+CoreDataClass.swift
//  CoreDataJSON
//
//  Created by Master Family on 01/10/2020.
//
//

import Foundation
import CoreData


public class Friend: NSManagedObject, Decodable, Identifiable {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var friendOf: User?
    
    public var wrappedName: String {
        name ?? "Unknown"
    }
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    enum CodingKeys: CodingKey {
        case name, id
    }
    
    required convenience public init(from decoder: Decoder) throws {
        
        // first we need to get the context again
        guard let context = decoder.userInfo[CodingUserInfoKey.context!] as? NSManagedObjectContext else { throw ProductError.contextMissing }
        
        // then the entity we want to decode into, in this example it's the 'Friend' entity
        guard let entity = NSEntityDescription.entity(forEntityName: "Friend", in: context) else { throw ProductError.entityCreationFailed }
        
        // init self with the entity and context we just got
        self.init(entity: entity, insertInto: context)
        
        // as usual we need a container, I skipped creating the CodingKeys enum since that should be trivial
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // the rest is just doing the actual decoding, finally
        // I decided to remove the '?' from the properties in the classes of my entities since I know the data will be there

        self.id = try container.decode(UUID.self, forKey: .id)
        // if you wanted to leave them option and use wrappers, just use 'decodeIfPresent' instead of just 'decode'
        
        // the two not completely trivial properties are 'tags' and 'friends'
        // for tags I just decode the data first, then save it into the entities property
        self.name = try container.decode(String.self, forKey: .name)
        
              
    }

}
