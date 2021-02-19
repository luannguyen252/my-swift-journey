//
//  MastermindClue.swift
//  Created by Julian Schiavo on 13/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import RealityKit
import UIKit

public class MastermindClue: Clue {
    public let id = "mastermind"
    public let supportsAdditionalHelp = true
    public let containsEducationalContent = true
    
    public var parentEntity: Entity?
    
    public let hint = "Use information gained from submitting different attempts to help you figure out which colors go where."
    public let tip = "Tap a ball to switch color, and try to get the right colors in the right order."
    
    public let answerType = AnswerType.custom
    public let answers = [String]()
    
    public func load() throws {
        let entity = try Experience.loadMastermind()
        
        if let firstBall = entity.fixedBall1 {
            setEntityColor(firstBall, color: ballColors[0])
        }
        if let secondBall = entity.fixedBall2 {
            setEntityColor(secondBall, color: ballColors[1])
        }
        if let thirdBall = entity.fixedBall3 {
            setEntityColor(thirdBall, color: ballColors[2])
        }
        if let fourthBall = entity.fixedBall4 {
            setEntityColor(fourthBall, color: ballColors[3])
        }
        
        parentEntity = entity
    }
    
    // MARK: - Custom Behaviour
    
    /// The state of a ball
    private enum State {
        case correctColorAndPosition
        case correctColor
        case incorrect
    }
    
    /// All possible colors
    private var colors: [SimpleColor] = [
        SimpleColor(red: 98, green: 187, blue: 71),
        SimpleColor(red: 252, green: 184, blue: 39),
        SimpleColor(red: 224, green: 58, blue: 60),
        SimpleColor(red: 150, green: 61, blue: 151),
        SimpleColor(red: 0, green: 157, blue: 220)
    ]
    
    /// The correct colors in order
    private var correctColors: [SimpleColor] { GameContent.mastermindColors }
    
    /// Array containing the current color of each ball
    private var ballColors = [
        SimpleColor(red: 98, green: 187, blue: 71),
        SimpleColor(red: 252, green: 184, blue: 39),
        SimpleColor(red: 224, green: 58, blue: 60),
        SimpleColor(red: 150, green: 61, blue: 151)
    ]
    
    /// Whether additional help has already been shown, used to show more help the second time
    private var hasAlreadyShownAdditionalHelp = false
    
    public func submitAnswer(_ answer: String?) -> AnswerResult {
        // Don't allow duplicate colors, as they are not used in answers to make it easier for younger students
        guard Set(ballColors).count == ballColors.count else {
            return .incorrect(title: "Invalid Answer", message: "Each ball must be a different color.")
        }
        
        // Iterates over the balls to determine how many are of the correct color and position, which is given to the player to help them order the balls
        var states = [State]()
        for (i, color) in ballColors.enumerated() {
            let correctColor = correctColors[i]
            if color == correctColor {
                states.append(.correctColorAndPosition)
            } else if correctColors.contains(color) {
                states.append(.correctColor)
            } else {
                states.append(.incorrect)
            }
        }
        
        let allCorrect = states.allSatisfy { $0 == .correctColorAndPosition }
        if allCorrect  {
            return .correct
        } else {
            // If the ball order isn't comletely correct, help the player by telling them how many balls are of the correct color and position
            let countCorrectColorAndPosition = states.filter { $0 == .correctColorAndPosition }.count
            let countCorrectColorOnly = states.filter { $0 == .correctColor }.count
            let hasRemaining = countCorrectColorAndPosition + countCorrectColorOnly != 4
            let title = ""
            let message = """
\(countCorrectColorAndPosition) \(countCorrectColorAndPosition == 1 ? "ball is" : "balls are") the correct color in the right position.\n
\(countCorrectColorOnly) \(countCorrectColorOnly == 1 ? "ball is" : "balls are") of the correct color in the wrong position.
\(hasRemaining ? "\nThe remaining balls are not the right color." : "")
"""
            return .incorrect(title: title, message: message)
        }
    }
    
    /// Helps the user by telling them some of the correct colors
    public func showAdditionalHelp() {
        if let ball = parentEntity?.findEntity(named: "fixed-ball1") {
            ballColors[0] = correctColors[0]
            setEntityColor(ball, color: correctColors[0])
        }
        if let ball = parentEntity?.findEntity(named: "fixed-ball2") {
            ballColors[1] = correctColors[1]
            setEntityColor(ball, color: correctColors[1])
        }
        if hasAlreadyShownAdditionalHelp, let ball = parentEntity?.findEntity(named: "fixed-ball3") {
            ballColors[2] = correctColors[2]
            setEntityColor(ball, color: correctColors[2])
        }
        hasAlreadyShownAdditionalHelp = true
    }
    
    // MARK: - Custom Behaviour: Tap Gestures
    
    public func entitiesTapped(_ entities: [Entity]) {
        let entity = entities.first { $0.name.contains("fixed-ball") }
        self.entityTapped(entity)
    }
    
    /// Determines which ball was tapped and switches it to the next color in the array
    private func entityTapped(_ entity: Entity?) {
        guard let entity = entity else { return }
        
        let stringID = entity.name.replacingOccurrences(of: "fixed-ball", with: "")
        guard let id = Int(stringID) else { return }
        let index = id - 1
        
        let currentColor = ballColors[index]
        let nextColor = colorAfter(currentColor)
        
        ballColors[index] = nextColor
        setEntityColor(entity, color: nextColor)
    }
    
    /// Finds the color after the current color, wrapping to the first color if the ball is currently the last possible color
    private func colorAfter(_ color: SimpleColor) -> SimpleColor {
        guard let currentColorIndex = colors.firstIndex(of: color) else { return color }
        let possibleColors = colors.suffix(from: currentColorIndex) + colors
        return possibleColors.first { $0 != color } ?? color
    }
    
    /// Sets a ball's color by setting it's `materials` to a new `SimpleMaterial`
    private func setEntityColor(_ entity: Entity, color: SimpleColor) {
        guard let modelEntity = entity as? ModelEntity ?? entity.children.compactMap({ $0 as? ModelEntity }).first else { return }
        modelEntity.model?.materials = [SimpleMaterial(color: color.uiColor, roughness: 0.4, isMetallic: true)]
    }
}
