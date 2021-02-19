//
//  Clue.swift
//  Created by Julian Schiavo on 9/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import Foundation
import RealityKit
import SwiftUI

/// A type of answer used in a clue
public enum AnswerType {
    /// Displays the default answer field at the bottom of the game UI
    case `default`
    
    /// Displays a single large submit button at the bottom of the game UI
    case custom
    
    /// Does not display any answer field or submit button
    case none
}

public enum AnswerResult {
    case correct
    case incorrect(title: String, message: String)
}

/// The base type used for clues/puzzles in the escape room
public protocol Clue {
    /// A unique identifier used to identify the clue
    var id: String { get }
    /// The main RealityKit entity for the clue, displayed when the clue is shown
    var parentEntity: Entity? { get set }
    /// Whether the clue supports 'additional help', which shows more content when the hint button is tapped multiple times
    var supportsAdditionalHelp: Bool { get }
    /// Whether the clue contains educational content, shown after the clue is completed
    var containsEducationalContent: Bool { get }
    
    /// A hint for the clue, shown when the user taps the hint button
    var hint: String { get }
    /// An instructional tip for the clue, shown at all times to make it clear what should be done
    var tip: String { get }
    
    /// The type of answer supported by the clue, for example, some clues require a text answer while others require interacting with the AR objects
    var answerType: AnswerType { get }
    /// The valid textual answers for the clue
    var answers: [String] { get }
    
    /// Asks the clue to load the RealityKit entities
    func load() throws
    /// Used to perform something after the clue has been displayed
    func sceneLoaded()
    /// Used to perform something after the clue is solved
    func finish()
    
    /// Shows the additional help if supported by the clue. Called when the hint button is tapped multiple times.
    func showAdditionalHelp()
    /// Submits an answer when using `AnswerType.custom`
    func submitAnswer(_ answer: String?) -> AnswerResult
    
    /// Notifies the clue that entities were tapped
    func entitiesTapped(_ entities: [Entity])
    
    /// Generates the educational content if supported by the clue
    func educationalContent() -> EducationalContent<AnyView>
}

public extension Clue {
    func sceneLoaded() {
        return
    }
    
    func finish() {
        return
    }
    
    func showAdditionalHelp() {
        return
    }
    
    func submitAnswer(_ answer: String? = nil) -> AnswerResult {
        fatalError("Not implemented")
    }
    
    func entitiesTapped(_ entities: [Entity]) {
        return
    }
    
    func educationalContent() -> EducationalContent<AnyView> {
        EducationalContent(imageName: "", title: "") {
            AnyView(Text(""))
        }
    }
}
