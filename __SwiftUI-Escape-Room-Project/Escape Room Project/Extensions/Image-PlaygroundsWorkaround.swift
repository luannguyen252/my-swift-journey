//
//  Image-PlaygroundsWorkaround.swift
//  Escape Room Project
//
//  Created by Julian Schiavo on 17/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// Helper method used to load images on Swift Playgrounds as SwiftUI images do not load normally
public extension Image {
    init(_ name: String, isTemplateImage: Bool = false) {
        guard let uiImage = UIImage(named: name)?.withRenderingMode(isTemplateImage ? .alwaysTemplate : .automatic) else {
            let error = GameEngine.State.error("There was an error loading game resources, which are required to play. Make sure the UserResources folder in the Playground Book file is intact and contains all the files, then try again.\n\nIf this continues happening, try download the Playground Book again or restart the device.")
            GameEngine.current.changeState(to: error)
            self.init("", bundle: nil)
            return
        }
        self.init(uiImage: uiImage)
    }
}
