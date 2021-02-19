//
//  GameEngine.swift
//  Created by Julian Schiavo on 9/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import ARKit
import Combine
import Foundation
import RealityKit
import SwiftUI

class GameEngine: NSObject, ObservableObject {
    
    /// A game state, used to determine what part of the game to display
    enum State: Equatable {
        case loading
        case error(String)
        case selectingAccessibilityPreferences
        case heatWarning
        
        case notPlaying
        case coaching
        case planeCoaching
        
        case playing
        case showingEducationalContent
        
        case finished
        case outro
    }
    
    /// The current game state.
    /// `private(set)` is used as the `changeState(to:` function must be used as it adds an animation to state changes
    @Published private(set) var state: State = .loading
    /// Whether the state should be switched to `.coaching` after the educational content is shown, used to avoid starting coaching or reinitialization of the `ARView` while educational content is displayed
    private var wantsCoachingAfterEducationalContent = false
    
    // Properties containing the main `ARView` and related coaching views/containers
    weak var arView: ARView?
    weak var arCoachingOverlayView: ARCoachingOverlayView?
    
    /// The current clue that is being played
    @Published var currentClue: Clue
    /// All of the clues, initialized immediately as they are structs and do not take up memory until the entities are loaded
    private var clues: [Clue] = [MorseCodeClue(), PuzzleClue(), MastermindClue(), PadSortClue(), CodebreakingClue()]
    private var congratulationsScene: Experience.Congratulations?
    
    /// The current clue index
    var clueNumber: Int { (clues.firstIndex { $0.id == currentClue.id } ?? 0) + 1 }
    /// The total clue count
    var clueCount: Int { clues.count }
    
    /// The current answer typed by the user, bound to the game UI's `AnswerField`
    @Published var currentAnswer = ""
    
    /// The current message displayed to the user (from the `tip` property in a clue)
    @Published var message: String?
    
    /// Whether audio is enabled, set to `false` if the user selects "Disable" on the accessibility screen
    @Published var isAudioEnabled = true
    /// Whether accurate plane detection is disabled, which uses a less accurate `AnchorEntity`, set by the user tapping "Skip" on the plane coaching screen
    @Published var isAccuratePlaneDetectionDisabled = false {
        didSet {
            planeCoachingFinished()
        }
    }
    
    /// All of the valid planes detected during the `.planeCoaching` state
    var planes = [Plane]()
    /// The plane selected by the user on which objects should be placed
    var selectedPlane: Plane? {
        didSet {
            if selectedPlane == nil, !isAccuratePlaneDetectionDisabled {
                planeCoachingStarted()
            } else {
                planeCoachingFinished()
            }
        }
    }
    
    /// An array containing the gesture recognizers installed on entities, used to disable recognizers when a clue is completed as they interfere with gestures later on in the game
    private var entityGestureRecognizers = [UIGestureRecognizer]()
    
    // MARK: - Initialization
    
    /// Singleton with the current `GameEngine`
    static let current = GameEngine()
    
    /// Singleton initializer which sets the initial clue and message and loads clue entities
    private override init() {
        guard let clue = clues.first else {
            fatalError("At least one scene required")
        }
        currentClue = clue
        message = clue.tip
        
        super.init()
        
        loadContent()
    }
    
    // MARK: - State
    
    /// Changes the current game state using an animation
    func changeState(to newState: State) {
        // If there is an error, don't change state as it would hide the error screen
        // These errors are *not* solvable and require re-running
        if case .error = state { return }
        
        var newState = newState
        
        if state == .showingEducationalContent, newState == .coaching || newState == .planeCoaching {
            newState = .showingEducationalContent
        }
        if state == .showingEducationalContent, wantsCoachingAfterEducationalContent {
            newState = arCoachingOverlayView?.isActive == true ? .coaching : .planeCoaching
        }
        if state == .selectingAccessibilityPreferences,
            newState == .notPlaying,
            ProcessInfo.processInfo.thermalState != .fair,
            ProcessInfo.processInfo.thermalState != .nominal {
            newState = .heatWarning
        }
        if !ARWorldTrackingConfiguration.isSupported {
            newState = .error("Your device does not support AR, which is required to play this game. AR requires a device with iOS 11 or later and with an A9 processor or later, such as the iPad (5th generation) and all iPad Pro models.")
        }
        if newState == .playing {
            loadScene()
        }
        
        withAnimation {
            self.state = newState
        }
    }
    
    /// Shows educational content if supported by the clue, or goes to the next clue
    func showEducationalContent() {
        DispatchQueue.runAfter(0.3) {
            if self.currentClue.containsEducationalContent {
                self.changeState(to: .showingEducationalContent)
            } else {
                self.nextScene()
            }
        }
    }
    
    /// Ends the game and displays the success screen
    func endGame() {
        changeState(to: .finished)
        loadScene(entity: congratulationsScene)
        DispatchQueue.runAfter(2) {
            self.changeState(to: .outro)
        }
    }
    
    // MARK: - Content Loading
    
    /// Loads clue content/entities and switches state after finished
    /// As `loadAsync` was not working correctly, clues are loaded synchronously at the start of the game
    /// This avoids pausing the game in the middle
    func loadContent(withDelay: Bool = true, nextState: State = .selectingAccessibilityPreferences) {
        for clue in clues {
            loadClue(clue)
        }
        loadCongratulations()
        
        if withDelay {
            DispatchQueue.runAfter(1.0) { // A short delay is used by default to avoid flashing the loading screen
                self.changeState(to: nextState)
            }
        } else {
            changeState(to: nextState)
        }
    }
    
    /// Loads the entities for a single clue, and sets the error state if the clue was not loaded successfully
    func loadClue(_ clue: Clue) {
        do {
            try clue.load()
        } catch {
            changeState(to: .error("There was an error loading the AR scenes, which are required to play. Make sure the UserResources folder is intact and contains all the files, then try again.\n\nIf this continues happening, try download the Playground Book again or restart the device."))
        }
    }
    
    /// Loads the final congratulations scene, shown after completing all puzzles
    private func loadCongratulations() {
        do {
            congratulationsScene = try Experience.loadCongratulations()
        } catch {
            changeState(to: .error("There was an error loading the AR scenes, which are required to play. Make sure the UserResources folder is intact and contains all the files, then try again.\n\nIf this continues happening, try download the Playground Book again or restart the device."))
        }
    }
    
    // MARK: - Answers
    
    /// The default correct answer alert
    private var successAlertConfig = (title: "Correct!", message: "")
    /// The default incorrect answer alert
    private let failureAlertConfig = (title: "That's not the right answer", message: "Try again or ask for a hint by tapping the question mark button.")
    
    /// Shows additional help if supported by the current clue
    func showAdditionalHelp() {
        currentClue.showAdditionalHelp()
    }
    
    /// Submits an answer and matches it to the valid answers from the clue, showing educational content or the next clue if correct
    @discardableResult func submitAnswer(_ answer: String) -> (title: String, message: String) {
        guard currentClue.answerType != .custom else {
            return submitCustomAnswer(answer)
        }
        
        let answer = answer.lowercased()
        guard currentClue.answers.contains(answer) else { return failureAlertConfig }
        
        currentAnswer = ""
        showEducationalContent()
        return successAlertConfig
    }
    
    /// Asks the clue to submit a custom answer type, and shows a custom alert provided by the clue
    func submitCustomAnswer(_ answer: String) -> (title: String, message: String) {
        let result = currentClue.submitAnswer(answer)
        switch result {
        case .correct:
            currentAnswer = ""
            showEducationalContent()
            return successAlertConfig
        case let .incorrect(title: title, message: message):
            return (title: title, message: message)
        }
    }
    
    // MARK: - Scenes
    
    /// Switches to the next clue
    func nextScene() {
        guard let currentClueIndex = clues.firstIndex(where: { $0.id == currentClue.id }) else {
            fatalError("Failed to get current scene index")
        }
        clearScene()
        
        // Notifies the current clue that it has finished, so it can deallocate private resources
        currentClue.finish()
        
        // Deallocates and resets clue resources to free up memory
        currentClue.parentEntity?.removeFromParent()
        currentClue.parentEntity = nil
        
        // If there are no remaining clues, end the game, otherwise, move to the next clue
        let nextIndex = clues.index(after: currentClueIndex)
        guard nextIndex < clues.count else {
            endGame()
            return
        }
        let nextClue = clues[nextIndex]
        currentClue = nextClue
        
        changeState(to: .playing)
        
        withAnimation {
            self.message = self.currentClue.tip
        }
    }
    
    /// Loads the current clue into the `ARView`
    func loadScene(entity: Entity? = nil) {
        guard let arView = arView, let parentEntity = entity ?? currentClue.parentEntity else { return }
        clearScene()
        
        // Remove the plane's anchor entity from the scene, as it will be added back later
        if selectedPlane?.anchorEntity.parent != nil {
            selectedPlane?.anchorEntity.removeFromParent()
        }
        
        // Reset and remove any entity gesture recognizers added previously to avoid causing issues with other gesture recognizers
        entityGestureRecognizers.forEach {
            $0.isEnabled = false
        }
        entityGestureRecognizers = []
        
        // Adds gestures to all entities which aren't fixed, recursively
        let children = parentEntity.recursiveChildren {
            $0.name.contains("fixed")
        }
        for entity in children {
            guard let entity = entity as? (HasCollision & HasPhysicsBody) else { continue }
            let newGestureRecognizers = arView.installGestures([.rotation, .translation], for: entity)
            entityGestureRecognizers.append(contentsOf: newGestureRecognizers)
        }
        
        // Adds the clue's entities to the `ARView`, based on whether a specific plane is available, otherwise using a generic `AnchorEntity`
        if let plane = selectedPlane {
            plane.anchorEntity.addChild(parentEntity)
            arView.scene.addAnchor(plane.anchorEntity)
        } else if isAccuratePlaneDetectionDisabled {
            let anchor = AnchorEntity(plane: .horizontal, classification: .any, minimumBounds: [0.3, 0.3])
            anchor.addChild(parentEntity)
            arView.scene.anchors.append(anchor)
        }
        
        // Notifies the clue that the scene has finished loading, so that preparation can be performed, such as playing audio
        currentClue.sceneLoaded()
    }
    
    func clearScene() {
        // Removes planes from plane coaching to avoid flickering elements
        planes.forEach { plane in
            plane.entity.removeFromParent()
        }
    }
    
    /// Resets the `ARView` tracking and removes all anchors, allowing the scene to be moved to a new position
    func resetScene() {
        guard let arView = arView else { return }
        
        // Pause the session to avoid causing isseus or wasting energy with tracking as it will be reset
        arView.session.pause()
        
        // Removes all planes as plane coaching will be performed again
        clearScene()
        planes = []
        selectedPlane = nil
        
        // Removes all anchors and entities from the scene
        arView.scene.anchors.forEach { anchor in
            anchor.position = .zero
            anchor.removeFromParent()
            
            anchor.children.forEach {
                $0.position = .zero
                $0.removeFromParent()
            }
        }
        
        // Starts a new AR configuration, using the same initial settings but ignoring previous information
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        configuration.environmentTexturing = .automatic
        
        let supportedVideoFormats = ARWorldTrackingConfiguration.supportedVideoFormats
            .filter { $0.captureDevicePosition == .back }
        configuration.videoFormat = supportedVideoFormats.last ?? configuration.videoFormat
        configuration.providesAudioData = false
        
        arView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
        
        // Loads clue entities again to reset their state and position
        loadContent(withDelay: false, nextState: .coaching)
    }
}
