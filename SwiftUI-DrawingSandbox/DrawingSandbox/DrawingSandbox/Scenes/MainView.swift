//
//  MainView.swift
//  DrawingSandbox
//
//  Created by CypherPoet on 11/5/19.
// ✌️
//

import SwiftUI

struct MainView: View {
}

// MARK: - Computeds
extension MainView {  }

// MARK: - Body
extension MainView {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Drawing Example 1")) {
                    NavigationLink(destination: TrianglePathExample()) {
                        Text("Basic Triangle Path")
                    }
                    NavigationLink(destination: CustomShapesExample()) {
                        Text("Custom Shapes")
                    }
                }
                
                Section(header: Text("Drawing Example 2")) {
                    NavigationLink(destination: RadialFlowerExample()) {
                        Text("CGAffineTransform & Even-Odd Fills")
                    }
                    
                    NavigationLink(destination: ColorGradientCyclingExample()) {
                         Text("Activating Metal Rendering")
                     }
                }
                
                Section(header: Text("Drawing Example 3")) {
                    NavigationLink(destination: BlendModesListView()) {
                        Text("All the Blend modes")
                    }

                    NavigationLink(destination: ScreenedCirclesExample()) {
                        Text("Screened Circles")
                    }
                    
                    NavigationLink(destination: AnimatableDataExample()) {
                        Text("Animating Custom Shapes w/ AnimatableData")
                    }
                    
                    NavigationLink(destination: AnimatablePairExample()) {
                        Text("Using AnimatablePair for multiple properties")
                    }
                    
                    NavigationLink(destination: SpirographExample()) {
                        Text("Drawing a Spirograph")
                    }
                }
                
                Section(header: Text("Drawing Example 4")) {
                    NavigationLink(destination: ArrowExample()) {
                        Text("Custom Arrow Shape")
                    }
                    
                    NavigationLink(destination: ColorCyclingRectangleExample()) {
                        Text("Color-Cyling Rectangle")
                    }
                }
            }
            .navigationBarTitle("SwiftUI Drawing")
        }
    }
}

// MARK: - View Variables
extension MainView {  }

// MARK: - Preview
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
