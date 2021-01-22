//
//  File.swift
//  
//
//  Created by Max Kuznetsov on 30.06.2020.
//

import Foundation

public extension AnyAction {
    
    struct Error: Actionable, Equatable {
        public var error: String?
        public var id: AnyHashable
        
        public init<Id: Hashable>(error: String? = nil, id: Id) {
            self.error = error
            self.id = AnyHashable(id)
        }
    }
    
    struct Message: Actionable, Equatable {
        public var message: String?
        public var id: AnyHashable
        
        public init<Id: Hashable>(message: String? = nil, id: Id) {
            self.message = message
            self.id = AnyHashable(id)
        }
    }
    
    struct DidLoadItem<M: Equatable>: Actionable, Equatable {
        public var item: M
        public var id: AnyHashable?
        
        public init(item: M) {
            self.item = item
        }
        
        public init<Id: Hashable>(item: M, id: Id) {
            self.item = item
            self.id = AnyHashable(id)
        }
    }
    
    struct DidLoadItems<M: Equatable>: Actionable, Equatable {
        public var items: [M]
        public var id: AnyHashable
        
        public init<Id: Hashable>(items: [M], id: Id) {
            self.items = items
            self.id = AnyHashable(id)
        }
    }
    
    struct DidUpdateItem<M: Equatable>: Actionable, Equatable {
        public var item: M
        public var id: AnyHashable?
        
        public init(item: M) {
            self.item = item
        }
        
        public init<Id: Hashable>(item: M, id: Id) {
            self.item = item
            self.id = AnyHashable(id)
        }
    }
    
    struct DeleteItem<M: Equatable>: Actionable, Equatable {
        public var item: M
        public var id: AnyHashable?
        
        public init(item: M) {
            self.item = item
        }
        
        public init<Id: Hashable>(item: M, id: Id) {
            self.item = item
            self.id = AnyHashable(id)
        }
    }
}
