//
//  PhotoAppTests.swift
//  PhotoAppTests
//
//  Created by sergio on 06/04/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import XCTest

@testable import PhotoApp

class PhotosTests: XCTestCase {
    
    var photoStore : OpaquePointer!
    
    override func setUp() {
        if photoStore == nil {
            let fileURL = try! FileManager.default.url(for: .documentDirectory,
                                                       in: .userDomainMask,
                                                       appropriateFor: nil,
                                                       create: false)
                .appendingPathComponent("PhotoStoreTest.sqlite")
            
            photoStore = create(store: fileURL)
            createTable(db: photoStore)
        }
    }
    
    
    override func tearDown() {
        
        close(db: photoStore)
    }
    
    func test_1_Insert() {
        
        insert(db: photoStore, PhotoInfo(uid: 0, filename: "Virtual Photo 1",
                                         title: "Photo Title", description: "",
                                         tags: "móuntains,flower,➤,ríver"))
        
        insert(db: photoStore, PhotoInfo(uid: 0, filename: "Virtual Photo 2",
                                         title: "Photo Title", description: "",
                                         tags: "mountains,flower,➤,river,sun"))
        
        XCTAssertEqual(count(db: photoStore), 2)
    }
    
    func test_2_Lookup() {
        
        let photoInfo = lookup(db: photoStore, uid: 1)
        print("LOOKUP: \(photoInfo)")
    }
    
    func test_3_Delete() {
        
        let photoUids = lookup(db: photoStore, tag: "➤")
        print("LOOKUP: \(photoUids)")
        for photoUid in photoUids {
            delete(db: photoStore, uid: photoUid)
        }
        XCTAssertEqual(count(db: photoStore), 0)
    }
    
}
