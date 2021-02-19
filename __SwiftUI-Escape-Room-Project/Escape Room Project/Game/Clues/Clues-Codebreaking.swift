//
//  CodebreakingClue.swift
//  Created by Julian Schiavo on 16/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import RealityKit

public class CodebreakingClue: Clue {
    public let id = "codebreaking"
    public let supportsAdditionalHelp = false
    public let containsEducationalContent = false
    
    public var parentEntity: Entity?
    
    public let hint = "Find the shiny box."
    public let tip = "Decode the secret message."

    public let answerType = AnswerType.none // Don't show an answer field or submit button as the user has to tap the shiny box
    public let answers = [""]
    
    public func load() throws {
        let entity = try Experience.loadCodebreaking()
        parentEntity = entity
    }
    
    // If the correct block is tapped, the player has won
    public func entitiesTapped(_ entities: [Entity]) {
        let entity = entities.first { $0.name.contains("fixed-shiny") }
        guard entity != nil else { return }
        GameEngine.current.submitAnswer("")
    }
}
