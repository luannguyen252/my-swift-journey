//
//  Education-Puzzle.swift
//  Escape Room Project
//
//  Created by Julian Schiavo on 17/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

public extension PuzzleClue {
    func educationalContent() -> EducationalContent<AnyView> {
        EducationalContent(imageName: "rectangle.grid.3x2.fill", title: "Data Structures") {
            AnyView(PuzzleEducationalContent())
        }
    }
}

public struct PuzzleEducationalContent: View {
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("During this challenge, you matched together puzzle pieces to create words that you will use later on in the game. ")
            Text("In Computer Science, data structures are ways of organizing data, values, or information in an efficient way. A simple explanation is that most data structures represent some sort of list, but they are each different in how they organize, structure, and use the data.")
            Text("There are two similar data structures we will take a look at here: arrays and stacks.")
            
            Spacer().frame(height: 20)
            arraySection
            
            Spacer().frame(height: 20)
            stackSection
            
            Spacer().frame(height: 20)
        }.frame(maxHeight: .infinity)
    }
    
    private var array: some View {
        HStack(alignment: .top) {
            Image(systemName: "square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .offset(y: 40)
                .padding(.bottom, 40)
            Image(systemName: "square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
            Image(systemName: "square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
        }
    }
    
    private var arraySection: some View {
        Group {
            HStack(alignment: .lastTextBaseline) {
                Image(systemName: "rectangle.grid.1x2")
                    .font(Font.title.bold())
                Text("Arrays")
                    .font(.title)
                    .fontWeight(.bold)
            }
            array
            Text("One of the simplest data structures is an array, which is like a list. An array holds multiple items of the same type (e.g. a number). Getting items from the array is extremely fast.")
        }
    }
    
    private var stack: some View {
        HStack(alignment: .top) {
            Image(systemName: "square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
            Image(systemName: "square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
            Image(systemName: "square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60)
                .offset(y: 40)
                .padding(.bottom, 40)
        }
    }
    
    private var stackSection: some View {
        Group {
            HStack(alignment: .lastTextBaseline) {
                Image(systemName: "rectangle.stack")
                    .font(Font.title.bold())
                Text("Stacks")
                    .font(.title)
                    .fontWeight(.bold)
            }
            stack
            Text("Stacks are similar to arrays, but have a few key differences. They can be thought of as physical stacks; unlike arrays, where items can be inserted and removed anywhere, stacks only allow removing the top, or last inserted item, and adding items to the top.")
        }
    }
}
