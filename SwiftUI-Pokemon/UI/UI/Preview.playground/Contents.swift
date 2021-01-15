//: A UIKit based Playground for presenting user interface
  
import UIKit
import SwiftUI
import Model
import UI
import PlaygroundSupport

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = UIHostingController(rootView:
    ListViewContainer(
        resource: Resource(endpoint: pokemonPageEndpoint)
    )
)
