//
//  ContentView.swift
//  SwiftUI-AnimatableGradients
//
//  Created by Luan Nguyen on 09/01/2021.
//

import SwiftUI

struct ContentView {  }

// MARK: - View
extension ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Basics")) {
                    NavigationLink(destination: ShapesExample()) {
                        Text("Using with Shapes")
                    }
                    
                    NavigationLink(destination: ViewsExample()) {
                        Text("Using with Views")
                    }
                    
                    NavigationLink(destination: ViewsExample()) {
                        Text("Custom Gradient Directions")
                    }
                }
                
                Section(header: Text("Gradient Varieties")) {
                    NavigationLink(destination: LinearGradientsExample()) {
                        Text("Linear Gradients")
                    }
                    
                    NavigationLink(destination: RadialGradientsExample()) {
                        Text("Radial Gradients")
                    }
                    
                    NavigationLink(destination: AngularGradientsExample()) {
                        Text("Angular Gradients")
                    }
                }
                
                Section(header: Text("Scratchpads")) {
                    NavigationLink(destination: ScratchPad1View()) {
                        Text("ScratchPad 1")
                    }
                    NavigationLink(destination: ScratchPad2View()) {
                        Text("ScratchPad 2")
                    }
                }
            }
            .navigationBarTitle("Animatable Gradient")
        }
    }
}

// MARK: - Computeds
extension ContentView {  }

// MARK: - View Variables
extension ContentView {  }

// MARK: - Private Helpers
private extension ContentView {  }

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
