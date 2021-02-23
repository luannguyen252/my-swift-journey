//
//  TypeOfTemp.swift
//  Clima
//
//  Created by mohammad mugish on 29/01/21.
//

import Foundation
import RealmSwift


class TypeOfTemp : Object{
    @objc dynamic var id = 0
    @objc dynamic var type : Bool = true
    
    override class func primaryKey() -> String? {
        "id"
    }
}
