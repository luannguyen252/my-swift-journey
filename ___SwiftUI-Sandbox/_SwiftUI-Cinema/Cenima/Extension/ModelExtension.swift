//
//  ModelExtension.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//

import Foundation
import CoreData


extension CodingUserInfoKey {
  static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")!
}



extension JSONDecoder {
    convenience init(context: NSManagedObjectContext) {
        self.init()
        self.userInfo[.managedObjectContext] = context
    }
}
