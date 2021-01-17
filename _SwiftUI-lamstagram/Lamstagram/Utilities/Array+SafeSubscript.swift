//
//  Array+SafeSubscript.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 15/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

extension Array {
    public subscript(safe index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
