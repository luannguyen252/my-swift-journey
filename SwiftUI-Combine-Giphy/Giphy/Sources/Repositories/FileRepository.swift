//
//  FileRepository.swift
//  Giphy
//
//  Created by Amir on 27/10/2019.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation
import Combine

class FileRepository {
    
    // MARK: Properties
    
    let queue: DispatchQueue
    let fileManager: FileManager
    let cacheBaseURL: URL
    let imagesCacheBaseURL: URL
    
    
    // MARK: Lifecycle
    
    init() {
        self.queue = DispatchQueue(label: String(describing: FileRepository.self), qos: .background)
        self.fileManager = FileManager()
        self.cacheBaseURL = fileManager.urls(for: .cachesDirectory, in: .userDomainMask).first!
        self.imagesCacheBaseURL = self.cacheBaseURL.appendingPathComponent("images")
    }
    
    
    // MARK: Public functions
    
    func exists(in url: URL) -> Bool {
        return fileManager.fileExists(atPath: url.path)
    }
    
    func read(from url: URL) throws -> Data {
        return try queue.sync { try self.doRead(from: url) }
    }
    
    func readAsync(from url: URL) -> Future<Data, Error> {
        return Future { [weak self] promise in
            guard let self = self else {
                return promise(.failure(CombineError.released))
            }
            self.queue.async {
                do {
                    let result = try self.doRead(from: url)
                    promise(.success(result))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
    
    func write(_ item: Data, to url: URL) throws {
        try queue.sync { try self.doWrite(item, to: url) }
    }
    
    func writeAsync(_ item: Data, to url: URL) -> Future<Void, Error> {
        return Future { [weak self] promise in
            guard let self = self else {
                return promise(.failure(CombineError.released))
            }
            self.queue.async {
                do {
                    try self.doWrite(item, to: url)
                    promise(.success(()))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
    
    
    // MARK: Private functions
    
    private func doRead(from url: URL) throws -> Data {
        var isDir: ObjCBool = false
        guard fileManager.fileExists(atPath: url.path, isDirectory: &isDir) && !isDir.boolValue else {
            throw ReadWriteError.doesNotExist
        }
        
        return try Data(contentsOf: url)
    }
    
    private func doWrite(_ data: Data, to url: URL) throws {
        let folderURL = url.deletingLastPathComponent()
        
        var isFolderDir: ObjCBool = false
        if fileManager.fileExists(atPath: folderURL.path, isDirectory: &isFolderDir) {
            if !isFolderDir.boolValue {
                throw ReadWriteError.canNotCreateFolder
            }
        } else {
            do {
                try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)
            } catch {
                throw ReadWriteError.canNotCreateFolder
            }
        }
        
        var isDir: ObjCBool = false
        guard !fileManager.fileExists(atPath: url.path, isDirectory: &isDir) || !isDir.boolValue else {
            throw ReadWriteError.canNotCreateFile
        }
        
        try data.write(to: url)
    }
}


extension FileRepository {
    
    enum ReadWriteError: Error {
        
        // MARK: Cases
        
        case doesNotExist
        case canNotCreateFolder
        case canNotCreateFile
    }
    
}
