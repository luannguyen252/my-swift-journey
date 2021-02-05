//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Sandesh on 12/03/20.
//  Copyright © 2020 Sandesh. All rights reserved.
//

import SwiftUI

// Custom View
struct CapsuleText: View {
    var text:  String
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
        
    }
}

//Custom Modifiers
struct Title: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct WaterMark: ViewModifier {
    var text: String
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

//Custom Container

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0 ..< rows) { row in
                HStack {
                    ForEach(0 ..< self.columns) { column in
                        self.content(row,column)
                    }
                }
            }
        }
    }
    
    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}


// Challange 1

struct BlueLargeTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.largeTitle)
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
    
    func waterMarked(with text: String) -> some View {
        self.modifier(WaterMark(text: text))
    }
    
//    Challenge 1 View extension
    func largeBlurTitle() -> some View {
        self.modifier(BlueLargeTitle())
    }
}

struct ContentView: View {
    var body: some View {
        //        VStack(spacing: 30) {
        //            CapsuleText(text: "First")
        //            CapsuleText(text: "Second")
        //            .modifier(Title())
        //        }
        
        //        Text("This one for custom modifier")
        //        .titleStyle()
        
        //        Color.orange
        //        .frame(width: 300, height: 300)
        //        .waterMarked(with: "This is Watermark")
        
        
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
            .largeBlurTitle()
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
