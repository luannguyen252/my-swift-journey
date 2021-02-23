//
//  CustomObject.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//

import Foundation

public class CustomObject : NSObject, NSSecureCoding, Decodable, Identifiable{
    public static var supportsSecureCoding: Bool = true
    
    

   public var id: String?
   public var overview: String?
   public var releaseDate: String?
    public var voteAverage : String?
   public var title: String?
   public var posterPath: String?
    public var genre_ids : Array<Int>?
    public var uniqueID : String = UUID().uuidString
    
    enum CodingKeys:  String, CodingKey  {

        case title = "original_title"
        case posterPath = "poster_path"
        case overview = "overview"
        case voteAverage = "vote_average"
        case genre_ids = "genre_ids"
        case releaseDate = "release_date"
        case uniqueID = "uniqueID"
        case id = "id"



    }

    
    init(title : String){
        self.title = title
    }
    
    
    public func encode(with coder: NSCoder) {
        coder.encode(title, forKey: "original_title")
        coder.encode(posterPath, forKey: "poster_path")
        coder.encode(id, forKey: "id")
        coder.encode(overview, forKey: "overview")
        coder.encode(voteAverage, forKey: "vote_average")
        coder.encode(genre_ids, forKey: "genre_ids")
        coder.encode(releaseDate, forKey: "release_date")
        coder.encode(uniqueID, forKey: "uniqueID")
    }
    
    
    public required convenience init?(coder: NSCoder) {
        let m = coder.decodeObject(of: NSString.self, forKey: "original_title") as String? ?? ""
        
        self.init(title : m)
        posterPath = coder.decodeObject(of: NSString.self, forKey: "poster_path") as String? ?? ""
        id = coder.decodeObject(of: NSString.self, forKey: "id") as String? ?? ""
        overview = coder.decodeObject(of: NSString.self, forKey: "overview") as String? ?? ""
        voteAverage = coder.decodeObject(of: NSString.self, forKey: "vote_average") as String? ?? ""
        releaseDate = coder.decodeObject(of: NSString.self, forKey: "release_date") as String? ?? ""
        genre_ids = coder.decodeObject(of: NSArray.self, forKey: "genre_ids") as? Array<Int>

    }
    
    required convenience public init(from decoder: Decoder) throws {
        self.init(title: "No Title")
        
        let container = try decoder.container(keyedBy: CodingKeys.self)

        
        title = try container.decode(String.self, forKey: .title)
        posterPath = try container.decode(String.self, forKey: .posterPath)
        overview = try container.decode(String.self, forKey: .overview)
        voteAverage = try String(container.decode(Double.self, forKey: .voteAverage))

        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        genre_ids = try container.decode(Array.self, forKey: .genre_ids)
        id = try String(container.decode(Int32.self, forKey: .id))

    }
}
