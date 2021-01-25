//
//  UserData.swift
//  Connect 3 Game
//
//  Created by Sergey Sevriugin on 27/12/2019.
//  Copyright © 2019 Sergey Sevriugin. All rights reserved.
//

import Foundation

struct Score: Codable {
    var me: Int
    var you: Int
}

class UserData {
    var score: Score
    init() {
        score = Score(me: 0, you: 0)
        self.load()
    }
    
    func save() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(score)
            data.printJSON()
            
            if let documentDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentDir.appendingPathComponent(K.scorefile)
                do {
                    try data.write(to: fileURL)
                    print("Score is saved to the file URL: \(fileURL)")
                } catch {
                    print(error)
                }
            }
        } catch {
            print(error)
        }
    }
    
    func load() {
        if let documentDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentDir.appendingPathComponent(K.scorefile)
            do {
                let data = try Data(contentsOf: fileURL, options: [])
                print("Score is loaded. Decode it...")
                let decoder = JSONDecoder()
                do {
                    let score = try decoder.decode(Score.self, from: data)
                    print("...decoded!")
                    print(score)
                    self.score = score
                } catch {
                    print(error)
                    self.score = Score(me: 0, you: 0)
                }
            } catch {
                print(error)
                self.score = Score(me: 0, you: 0)
            }
        }
    }
    
}

//MARK: - Data extension

extension Data
{
    func printJSON()
    {
        if let JSONString = String(data: self, encoding: String.Encoding.utf8)
        {
            print(JSONString)
        }
    }
}
