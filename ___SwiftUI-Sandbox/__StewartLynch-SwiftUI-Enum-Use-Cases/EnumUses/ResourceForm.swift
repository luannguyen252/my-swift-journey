//
//  ResourceForm.swift
//  EnumUses
//
//  Created by Stewart Lynch on 2021-02-16.
//

import Foundation

class ResourceForm: ObservableObject {
    @Published var name = ""
    @Published var url = ""
    @Published var resourceType: Resource.ResourceType = .website
    
    var id: UUID? // Is nil when we are creating a new resource
    var updating: Bool {
        return id != nil
    }
    
    // This initializer is used when we are creating a new Resource
    init() {}
    
    // This initializer is used when we are updating an existing Resource
    init(_ resource: Resource) {
        id = resource.id
        name = resource.name
        url = resource.url
        resourceType = resource.resourceType
    }
}
