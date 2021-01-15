//
//  ContentView.swift
//  SimpleAnimations
//
//  Created by Sud on 6/22/19.
//  Copyright © 2019 MyCompany. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State private var basicAnimation = false
    @State private var springAnimation = false
    @State private var isAnimating = false
    @State private var isContinuous = false
    @State private var isHamburgerShowing = true
    @State private var right = true
    @State private var isCheckmarkShowing = true
    @State private var isCelsius = true
    private var degree: Double = 180
    
    var body: some View {
        #if os(iOS)
            return AnyView(NavigationView { ListView().listStyle(GroupedListStyle()) })
        #else
            return AnyView(ListView())
        #endif
    }
}

struct ListView : View {
    @State private var basicAnimation = false
    @State private var springAnimation = false
    @State private var isAnimating = false
    @State private var isContinuous = false
    @State private var isHamburgerShowing = true
    @State private var right = true
    @State private var isCheckmarkShowing = true
    @State private var isCelsius = true
    private var degree: Double = 180
    
    var body: some View {
        List {
            Section(footer: Text("Tap to see animation")) {
                HStack {
                    Text("Basic")
                    Spacer()
                    Button(action: {
                        self.basicAnimation.toggle()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .rotationEffect(.degrees(basicAnimation ? 0 : 180))
                            .animation(.default)
                    }
                }
                .frame(height: 54.0)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.basicAnimation.toggle()
                }
                HStack {
                    Text("Spring")
                    Spacer()
                    Button(action: {
                        self.springAnimation.toggle()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .rotationEffect(.degrees(springAnimation ? 0 : 180))
                            .animation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0.2))
                    }
                }
                .frame(height: 54.0)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.springAnimation.toggle()
                }
                HStack {
                    Text("Hamburger to Cross")
                    Spacer()
                    Button(action: {
                        self.isHamburgerShowing.toggle()
                    }) {
                        Image(systemName: isHamburgerShowing ? "line.horizontal.3" : "multiply")
                            .font(.title)
                            .rotationEffect(.degrees(isHamburgerShowing ? 0 : 180))
                            .animation(.spring())
                    }
                }
                .frame(height: 54.0)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.isHamburgerShowing.toggle()
                }
                HStack {
                    Text("Right & Wrong")
                    Spacer()
                    Button(action: {
                        self.right.toggle()
                    }) {
                        Image(systemName: right ? "checkmark.circle" : "multiply.circle")
                            .font(.title)
                            .rotationEffect(.degrees(right ? 0 : 180))
                            .animation(.spring())
                    }
                }
                .frame(height: 54.0)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.right.toggle()
                }
                HStack {
                    Text("Checkmark to Close")
                    Spacer()
                    Button(action: {
                        self.isCheckmarkShowing.toggle()
                    }) {
                        Image(systemName: isCheckmarkShowing ? "checkmark" : "multiply")
                            .font(.title)
                            .rotationEffect(.degrees(isCheckmarkShowing ? 0 : 180))
                            .animation(.spring())
                    }
                }
                .frame(height: 54.0)
                .contentShape(Rectangle())
                .onTapGesture {
                    self.isCheckmarkShowing.toggle()
                }
                HStack {
                    Text("Continuos")
                    Spacer()
                    Image(systemName: "arrow.2.circlepath")
                        .font(.title)
                        .rotationEffect(Angle(degrees: isContinuous ? 360 : 0))
                        .animation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false))
                }
                .frame(height: 54.0)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .navigationBarTitle(Text("Simple Animations"))
        .onAppear {
            self.isContinuous = true
        }
    }
}
        
#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
