//
//  DictionaryRepresentation.swift
//  WaterMyPlantsWatch Extension
//
//  Created by Toomas Vahter on 08.02.2020.
//  Copyright © 2020 Augmented Code. All rights reserved.
//

import Foundation

protocol DictionaryConvertible {
    var dictionaryRepresentation: [String: Any] { get }
}

protocol DictionaryDecodable {
    init?(dictionary: [String: Any], decoder: JSONDecoder)
}

typealias DictionaryRepresentable = DictionaryConvertible & DictionaryDecodable

extension DictionaryConvertible where Self: Encodable {
    var dictionaryRepresentation: [String: Any] {
        let data = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
    }
}

extension DictionaryDecodable where Self: Decodable {
    init?(dictionary: [String: Any], decoder: JSONDecoder = JSONDecoder()) {
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            self = try decoder.decode(Self.self, from: data)
        }
        catch let nsError as NSError {
            print(nsError)
            return nil
        }
    }
}
