//
//  Card.swift
//  RealmDataBase (iOS)
//
//  Created by Balaji on 05/01/21.
//

import SwiftUI
import RealmSwift

// Creating Realm Object....

class Card: Object,Identifiable{
    
    @objc dynamic var id : Date = Date()
    @objc dynamic var title = ""
    @objc dynamic var detail = ""
}
