//
//  UserDefaults-extensions.swift
//  SnowSeeker
//
//  Created by Ryan Lintott on 2020-06-29.
//  Copyright © 2020 A Better Way To Do. All rights reserved.
//

import Foundation

extension UserDefaults {
    func decode<T: Decodable>(_ type: T.Type, forKey key: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys) -> T? {
        
        guard let data = self.object(forKey: key) as? Data else {
            return nil
        }
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = dateDecodingStrategy
        decoder.keyDecodingStrategy = keyDecodingStrategy
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch DecodingError.keyNotFound(let key, let context) {
            fatalError("Failed to decode \(type) from UserDefaults due to missing key '\(key.stringValue)' not found – \(context.debugDescription)")
        } catch DecodingError.typeMismatch(_, let context) {
            fatalError("Failed to decode \(type) from UserDefaults due to type mismatch – \(context.debugDescription)")
        } catch DecodingError.valueNotFound(let type, let context) {
            fatalError("Failed to decode \(type) from UserDefaults due to missing \(type) value – \(context.debugDescription)")
        } catch DecodingError.dataCorrupted(_) {
            fatalError("Failed to decode \(type) from UserDefaults because it appears to be invalid JSON")
        } catch {
            fatalError("Failed to decode \(type) from UserDefaults: \(error.localizedDescription)")
        }
    }
    
    func encode<T: Encodable>(_ encodableValue: T, forKey key: String, dateEncodingStrategy: JSONEncoder.DateEncodingStrategy = .deferredToDate, keyEncodingStrategy: JSONEncoder.KeyEncodingStrategy = .useDefaultKeys) {
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = dateEncodingStrategy
        encoder.keyEncodingStrategy = keyEncodingStrategy
        
        do {
            let data = try encoder.encode(encodableValue)
            let defaults = UserDefaults.standard
            defaults.set(data, forKey: key)
        } catch EncodingError.invalidValue(_, let context) {
            fatalError("Encoder could not encode invalid value of type \(T.Type.self) – \(context.debugDescription)")
        } catch {
            fatalError("Failed to encode \(T.Type.self) to key \(key) in UserDefaults: \(error.localizedDescription)")
        }
    }
}
