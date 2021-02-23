//
//  RealmPersistanceInitializer.swift
//  Clima
//
//  Created by mohammad mugish on 27/01/21.
//

import Foundation
import RealmSwift

class RealmPersistent {
    static func initializer() -> Realm {
        do {
            let realm = try Realm()
            
            return realm
        } catch let err {
            fatalError("Failed to open Realm error: \(err.localizedDescription)")
        }
    }
}
