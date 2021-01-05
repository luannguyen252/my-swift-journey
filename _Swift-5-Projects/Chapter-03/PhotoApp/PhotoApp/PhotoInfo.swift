//
//  PhotoInfo.swift
//  Photo2
//
//  Created by sergio on 31/03/2019.
//  Copyright © 2019 Sergio De Simone. All rights reserved.
//

import Foundation
import SQLite3

struct PhotoInfo {
    let uid: Int32
    let filename: String
    let title: String
    let description: String
    let tags: String
    
    init(uid: Int32 = -1, filename: String = "",
         title: String = "Untitled photo", description: String = "",
         tags: String = "") {
        
        self.uid = uid
        self.filename = filename
        self.title = title
        self.description = description
        self.tags = tags
    }
}

// SQLite3 Functions for PhotoInfo persistence

func createTable(db: OpaquePointer) {
    
    let tableDef = """
CREATE TABLE Photos(
id INTEGER PRIMARY KEY AUTOINCREMENT,
filename CHAR(255) NOT NULL,
title CHAR(255) NOT NULL,
description TEXT,
tags CHAR(255));
"""
    
    if sqlite3_exec(db, tableDef, nil, nil, nil) == SQLITE_DONE {
        print("Table created.")
    } else {
        print("Could not be create table.")
    }
}

internal let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)

func create(store: URL) -> OpaquePointer? {
    var db: OpaquePointer? = nil
    if sqlite3_open(store.absoluteString, &db) == SQLITE_OK {
        print("Opened connection to database at \(store.path)")
        return db
    } else {
        print("Unable to open database.")
    }
    return nil
}

func query(_ query: String, db: OpaquePointer, _ run: (OpaquePointer) -> Void) {
    var statement: OpaquePointer? = nil
    if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
        run(statement!)
    } else {
        print("Could not prepare SQL statement \(query)")
    }
    sqlite3_finalize(statement)
}

private func bind_photo(_ statement: OpaquePointer, _ photo: PhotoInfo) {
    sqlite3_bind_text(statement, 1, photo.filename, -1, SQLITE_TRANSIENT)
    sqlite3_bind_text(statement, 2, photo.title, -1, SQLITE_TRANSIENT)
    sqlite3_bind_text(statement, 3, photo.description, -1, SQLITE_TRANSIENT)
    sqlite3_bind_text(statement, 4, photo.tags, -1, SQLITE_TRANSIENT)
}

func insert(db: OpaquePointer, _ photo: PhotoInfo) {
    query("INSERT INTO Photos (filename,title,description,tags) VALUES (?,?,?,?);", db: db) { statement in

        bind_photo(statement, photo)
        if sqlite3_step(statement) == SQLITE_DONE {
            print("Successfully inserted row.")
        } else {
            print("Could not insert row.")
        }
    }
}

func lookup(db: OpaquePointer, uid: Int32) -> PhotoInfo {
    
    func sqlite3_column_swift_text(_ statement: OpaquePointer, _ index: Int32) -> String {
        let cstr = sqlite3_column_text(statement, index)
        if cstr != nil {
            return String(cString:cstr!)
        }
        return ""
    }
    
    var photo = PhotoInfo()
    query("SELECT * FROM Photos WHERE id=?;", db: db) { statement in
        sqlite3_bind_int(statement, 1, uid)
        if sqlite3_step(statement) == SQLITE_ROW {
            photo = PhotoInfo(uid: sqlite3_column_int(statement, 0),
                              filename: sqlite3_column_swift_text(statement, 1),
                              title: sqlite3_column_swift_text(statement, 2),
                              description: sqlite3_column_swift_text(statement, 3),
                              tags: sqlite3_column_swift_text(statement, 4))
        } else {
            print("Query returned no results")
        }
    }
    return photo
}

func lookup(db: OpaquePointer, tag: String) -> [Int32] {

    var results : [Int32] = []
    query("SELECT id FROM Photos WHERE tags LIKE '%\(tag)%';", db: db) { statement in
        var a = sqlite3_step(statement)
        while a == SQLITE_ROW {
            results.append(sqlite3_column_int(statement, 0))
            a = sqlite3_step(statement)
        }
    }
    return results
}

func count(db: OpaquePointer) -> Int32 {
    var count : Int32 = 0
    query("SELECT COUNT(*) FROM Photos;", db: db) { statement in
        if sqlite3_step(statement) == SQLITE_ROW {
            count = sqlite3_column_int(statement, 0)
        } else {
            print("Query returned no results")
        }
    }
    return count
}

func update(db: OpaquePointer, _ photo: PhotoInfo) {
    query("UPDATE Photos SET (filename,title,description,tags) = (?,?,?,?) WHERE id = ?;", db: db) { statement in
        
        bind_photo(statement, photo)
        sqlite3_bind_int(statement, 5, photo.uid)
        if sqlite3_step(statement) == SQLITE_DONE {
            print("Successfully updated row.")
        } else {
            print("Could not update row.")
        }
    }
}

func delete(db: OpaquePointer, uid: Int32) {
    query("DELETE FROM Photos WHERE id = ?;", db: db) { statement in
        sqlite3_bind_int(statement, 1, uid)
        if sqlite3_step(statement) == SQLITE_DONE {
            print("Successfully deleted row.")
        } else {
            print("Could not delete row.")
        }
    }
}

func close(db: OpaquePointer) {
    sqlite3_close(db)
}
