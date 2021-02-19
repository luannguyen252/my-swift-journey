//
//  PadSortClue.swift
//  Created by Julian Schiavo on 15/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import RealityKit
import UIKit

public class PadSortClue: Clue {
    public let id = "padsort"
    public let supportsAdditionalHelp = false
    public let containsEducationalContent = false
    
    public var parentEntity: Entity?
    
    public let hint = "Order the words by matching their color to one of the balls you ordered earlier."
    public let tip = "Order the words you found earlier using the order of the colors you found."
    
    public let answerType = AnswerType.default
    public let answers = ["ui design privacy flow"]
    
    public func load() throws {
        let entity = try Experience.loadPadSort()
        setInitialColors(entity: entity)
        parentEntity = entity
    }
    
    /// Sets the initial ball and key colors based on the Mastermind clue colors
    private func setInitialColors(entity: Experience.PadSort) {
        let colors = GameContent.mastermindColors
        if let ball = entity.fixedBall1 {
            setEntityColor(ball, color: colors[0])
        }
        if let ball = entity.fixedBall2 {
            setEntityColor(ball, color: colors[1])
        }
        if let ball = entity.fixedBall3 {
            setEntityColor(ball, color: colors[2])
        }
        if let ball = entity.fixedBall4 {
            setEntityColor(ball, color: colors[3])
        }
        
        if let block = entity.fixedBlock1 {
            setEntityMatteColor(block, color: colors[1])
        }
        if let block = entity.fixedBlock2 {
            setEntityMatteColor(block, color: colors[0])
        }
        if let block = entity.fixedBlock3 {
            setEntityMatteColor(block, color: colors[3])
        }
        if let block = entity.fixedBlock4 {
            setEntityMatteColor(block, color: colors[2])
        }
    }
    
    // MARK: - Custom Behaviour
    
    /// Sets an entity's color by setting it's `materials` to a new `SimpleMaterial`
    private func setEntityColor(_ entity: Entity, color: SimpleColor) {
        guard let modelEntity = entity as? ModelEntity ?? entity.children.compactMap({ $0 as? ModelEntity }).first else { return }
        modelEntity.model?.materials = [SimpleMaterial(color: color.uiColor, roughness: 0.4, isMetallic: true)]
    }
    
    /// Sets an entity's color by setting it's `materials` to a new `SimpleMaterial`
    private func setEntityMatteColor(_ entity: Entity, color: SimpleColor) {
        guard let modelEntity = entity as? ModelEntity ?? entity.children.compactMap({ $0 as? ModelEntity }).first else { return }
        modelEntity.model?.materials = [SimpleMaterial(color: color.uiColor, roughness: 1.0, isMetallic: false)]
    }
}

