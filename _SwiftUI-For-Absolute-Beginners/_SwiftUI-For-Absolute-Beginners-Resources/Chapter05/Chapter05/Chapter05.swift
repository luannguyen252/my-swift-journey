//
//  Chapter05.swift
//  Chapter05
//
//  Created by Jayant Varma on 17/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: - Version 01
struct Chapter05_01: View {
    var body: some View {
        Text("Hello World!")
    }
}

struct Chapter05_01_Previews:  PreviewProvider {
    static var previews: some View {
        Chapter05_01()
    }
}

// MARK: - Version 02
struct Chapter05_02: View {
    var body: some View {
        Text("Hello World!")
        .background(Color.red)
    }
}

struct Chapter05_02_Previews:  PreviewProvider {
    static var previews: some View {
        Chapter05_02()
    }
}


// MARK: - Version 03
struct Chapter05_03: View {
    var body: some View {
        Text("Hello World!")
        .padding()
        .background(Color.red)
    }
}

struct Chapter05_03_Previews:  PreviewProvider {
    static var previews: some View {
        Chapter05_03()
    }
}

// MARK: - Version 04
struct RainbowText: View {
    private var radius: CGFloat = 25.0
    
    var body: some View {
        Text("Rainbow")
        .padding()
        .background(Color.red)
        .cornerRadius(radius)
        .padding()
        .background(Color.orange)
        .cornerRadius(radius)
        .padding()
        .background(Color.yellow)
        .cornerRadius(radius)
        .padding()
        .background(Color.green)
        .cornerRadius(radius)
        .padding()
        .background(Color.blue)
        .cornerRadius(radius)
        .padding()
        .background(Color.purple)
        .cornerRadius(radius)
    }
}

struct RainbowText_Previews:  PreviewProvider {
    static var previews: some View {
        RainbowText()
    }
}


// MARK: - Version 04
struct ColoredCircles: View {
    var body: some View {
        ZStack {
            Circle().fill(Color.green)
            Circle().fill(Color.yellow).scaleEffect(0.8)
            Circle().fill(Color.orange).scaleEffect(0.6)
            Circle().fill(Color.red).scaleEffect(0.4)
        }.padding()
    }
}

struct ColoredCircles_Previews: PreviewProvider {
    static var previews: some View {
        ColoredCircles()
    }
}


// MARK: - Version 05

struct UserNameControl: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
            Text("Jayant Varma")
                .foregroundColor(Color.blue)
        }.font(.title)
    }
}


struct UserNameControl_Previews: PreviewProvider {
    
    static var previews: some View {
        UserNameControl()
    }
}


