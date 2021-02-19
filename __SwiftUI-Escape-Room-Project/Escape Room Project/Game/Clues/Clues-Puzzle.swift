//
//  PuzzleClue.swift
//  Created by Julian Schiavo on 15/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import RealityKit

public class PuzzleClue: Clue {
    public let id = "puzzle"
    public let supportsAdditionalHelp = false
    public let containsEducationalContent = true
    
    public var parentEntity: Entity?
    
    public let hint = "Put the puzzle pieces together to create words."
    public let tip = "Find the jumbled words."
    
    public let answerType = AnswerType.default
    public let answers = ["design flow privacy", "design privacy flow", "flow design privacy", "flow privacy design", "privacy design flow", "privacy flow design"]
    
    public func load() throws {
        parentEntity = try Experience.loadPuzzle()
    }
}
