//
//  FileStorage.swift
//  PokeMaster
//
//  Created by huhsx on 2020/8/3.
//  Copyright © 2020 huhsx. All rights reserved.
//

import Foundation

//对于任 何需要在 getter 或者 setter 中有重复处理的代码，我们都可以通过 @propertyWrapper 来定义特殊 “标记” 对其简化
@propertyWrapper
struct FileStorage<T: Codable> {
    
    var value: T?
    let directory: FileManager.SearchPathDirectory
    let fileName: String
    
    init(directory: FileManager.SearchPathDirectory, fileName: String) {
        self.directory = directory
        self.fileName = fileName
        
        value = try? FileHelper.loadJSON(from: directory, fileName: fileName)
    }
    
    var wrappedValue: T? {
        
        set {
            value = newValue
            if let value = newValue {
                try? FileHelper.writeJSON(value, to: directory, fileName: fileName)
            }else {
                try? FileHelper.delete(from: directory, fileName: fileName)
            }
        }
        
        get {
            value
        }
    }
}
