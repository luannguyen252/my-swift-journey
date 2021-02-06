//
//  FilesystemHelper.swift
//  AmbleShot
//
//  Created by myf on 04/11/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import Foundation


public class FilesystemHelper {
 
     /// Returns URL for specified file
     static func fileURL(filename: String) -> URL? {
        if let dirUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileUrl = dirUrl.appendingPathComponent(filename, isDirectory: false)
                return fileUrl
            }
         return nil
     }
 


     /// Store an encodable object to Documents
     static func store<T: Encodable>(_ object: T, filename: String) -> Bool{
         if let url = fileURL(filename: filename) {
         
             let encoder = JSONEncoder()
             do {
                 let data = try encoder.encode(object)
                 if FileManager.default.fileExists(atPath: url.path) {
                     try FileManager.default.removeItem(at: url)
                 }
                 return FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
             } catch {
                 print(error.localizedDescription)
             }
         }
         else {
             print("cannot construct file url")
         }
         return false
     }
 
    /// Retrieve and convert a struct from a file on disk
    static func retrieve<T: Decodable>(_ filename: String, as type: T.Type) -> T? {
         if let url = fileURL(filename: filename) {
         
             if !FileManager.default.fileExists(atPath: url.path) {
                 print("File at path \(url.path) does not exist!")
             }
             
             if let data = FileManager.default.contents(atPath: url.path) {
                 let decoder = JSONDecoder()
                 do {
                     let model = try decoder.decode(type, from: data)
                     return model
                 } catch {
                     print(error.localizedDescription)
                 }
             } else {
                 print("No data at \(url.path)!")
             }
         }
         else {
             print("cannot construct file url")
         }
         return nil
    }
 
    /// Returns BOOL indicating whether file exists at specified directory with specified file name
    static func fileExists(_ filename: String, with fileExtension: String) -> Bool {
         if let url = fileURL(filename: filename) {
             return FileManager.default.fileExists(atPath: url.path)
         }
         else {
             print("cannot construct file url")
         }
         return false
    }
    
    static func saveDataImage(data: Data, filename: String) -> String? {
        if let url = FilesystemHelper.fileURL(filename: filename) {
            do {
                //print (url.path)
                try data.write(to: url)
                return filename
            }
            catch {
                print(error.localizedDescription)
                return nil
            }
        }
        return nil
    }
}
