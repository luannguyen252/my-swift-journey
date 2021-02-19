//
//  MastermindClue.swift
//  Created by Julian Schiavo on 14/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

public extension MastermindClue {
    func educationalContent() -> EducationalContent<AnyView> {
        EducationalContent(imageName: "square.stack.3d.up.fill", title: "Sorting Algorithms") {
            AnyView(MastermindEducationalContent())
        }
    }
}

public struct MastermindEducationalContent: View {
    
    @State private var bubbleSortState = 0
    @State private var selectionSortState = 0
    
    private let itemFont = Font.system(size: 80, weight: .light)
    private let timer = Timer.publish(every: 1.5, on: .main, in: .common).autoconnect()
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("In this puzzle, you sorted balls of different colors. To sort the balls, you used trial and error by submitting multiple attempts to figure out the right order.")
            Text("Computers frequently need to sort lists for various reasons; it allows items in the list to be found faster, allows for specific items to be found (e.g. the largest item in the list), and allows for computers to know which items are near to other items (e.g. whose birthday is next).")
            
            Spacer().frame(height: 20)
            exampleSection
            
            Spacer().frame(height: 20)
            speedSection
            
            Spacer().frame(height: 20)
        }.frame(maxHeight: .infinity)
    }
    
    private var exampleSection: some View {
        Group {
            HStack(alignment: .lastTextBaseline) {
                Image(systemName: "lightbulb")
                    .font(Font.title.bold())
                Text("Example")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Text("An algorithm is a step by step way to solve problems. A recipe is an example of a simple algorithm, as it gives a step by step method to take the inputs (ingredients) and results in the output (the cooked dish).")
            bubbleSortAlgorithm
            Text("There are many different sorting algorithms, which are techniques used to sort items. For example, the above animation shows how the Bubble Sort algorithm works. It goes through the list item by item and swaps the items if the first one is larger.")
        }
    }
    
    private var speedSection: some View {
        Group {
            HStack(alignment: .lastTextBaseline) {
                Image(systemName: "hare")
                    .font(Font.title.bold())
                Text("Speed")
                    .font(.title)
                    .fontWeight(.bold)
            }
            Text("Some sorting algorithms are faster than others. They are used based on the one that is the most efficient for the given task, as this allows the sorting to finish quicker.")
            selectionSortAlgorithm
            Text("The above animation shows a different sorting algorithm, Selection Sort. Selection Sort is faster than the previous example, Bubble Sort, because it has to move items less and make fewer comparisons.")
            Text("In practice, there are many more efficient and faster sorting algorithms than the examples shown here, but they are much more complicated.")
        }
    }
    
    private var bubbleSortAlgorithm: some View {
        var pass = "First Pass"
        if bubbleSortState >= 7 {
            pass = "Third Pass"
        } else if bubbleSortState >= 5 {
            pass = "Second Pass"
        }
        
        return VStack(alignment: .center, spacing: 10) {
            Spacer().frame(height: 20)
            Text("Bubble Sort")
                .font(.title)
                .fontWeight(.bold)
            Text(pass)
                .font(.headline)
                .transition(.slide)
                .frame(maxWidth: .infinity)
            Spacer().frame(height: 20)
            HStack {
                if bubbleSortState == 0 {
                    Image(systemName: "5.circle").id(5).transition(.opacity)
                    Image(systemName: "1.circle").id(1).transition(.opacity)
                    Image(systemName: "4.circle").id(4).transition(.opacity)
                    Image(systemName: "2.circle").id(2).transition(.opacity)
                    Image(systemName: "8.circle").id(8).transition(.opacity)
                } else if bubbleSortState == 1 {
                    Image(systemName: "5.circle")
                        .id(5)
                        .foregroundColor(.red)
                        .transition(.asymmetric(insertion: .opacity, removal: .slide))
                    Image(systemName: "1.circle").id(1).transition(.opacity)
                    Image(systemName: "4.circle").id(4)
                    Image(systemName: "2.circle").id(2)
                    Image(systemName: "8.circle").id(8)
                } else if bubbleSortState == 2 {
                    Image(systemName: "1.circle").id(1)
                    Image(systemName: "5.circle")
                        .id(5)
                        .foregroundColor(.red)
                        .transition(.asymmetric(insertion: .opacity, removal: .slide))
                    Image(systemName: "4.circle").id(4).transition(.opacity)
                    Image(systemName: "2.circle").id(2)
                    Image(systemName: "8.circle").id(8)
                } else if bubbleSortState == 3 {
                    Image(systemName: "1.circle").id(1)
                    Image(systemName: "4.circle").id(4)
                    Image(systemName: "5.circle")
                        .id(5)
                        .foregroundColor(.red)
                        .transition(.asymmetric(insertion: .opacity, removal: .slide))
                    Image(systemName: "2.circle").id(2).transition(.opacity)
                    Image(systemName: "8.circle").id(8)
                } else if bubbleSortState == 4 {
                    Image(systemName: "1.circle").id(1)
                    Image(systemName: "4.circle").id(4)
                    Image(systemName: "2.circle").id(2)
                    Image(systemName: "5.circle").id(5).foregroundColor(.red)
                    Image(systemName: "8.circle").id(8)
                } else if bubbleSortState == 5 {
                    Image(systemName: "1.circle").id(1)
                    Image(systemName: "4.circle")
                        .id(4)
                        .foregroundColor(.red)
                        .transition(.asymmetric(insertion: .opacity, removal: .slide))
                    Image(systemName: "2.circle").id(2).transition(.opacity)
                    Image(systemName: "5.circle").id(5)
                    Image(systemName: "8.circle").id(8)
                } else if bubbleSortState == 6 {
                    Image(systemName: "1.circle").id(1)
                    Image(systemName: "2.circle").id(2)
                    Image(systemName: "4.circle").id(4).foregroundColor(.red)
                    Image(systemName: "5.circle").id(5)
                    Image(systemName: "8.circle").id(8)
                } else if bubbleSortState == 7 {
                    Image(systemName: "1.circle").id(1).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "2.circle").id(2).transition(.opacity)
                    Image(systemName: "4.circle").id(4).transition(.opacity)
                    Image(systemName: "5.circle").id(5).transition(.opacity)
                    Image(systemName: "8.circle").id(8).transition(.opacity)
                } else if bubbleSortState == 8 {
                    Image(systemName: "1.circle").id(1).transition(.opacity)
                    Image(systemName: "2.circle").id(2).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "4.circle").id(4).transition(.opacity)
                    Image(systemName: "5.circle").id(5).transition(.opacity)
                    Image(systemName: "8.circle").id(8).transition(.opacity)
                } else if bubbleSortState == 9 {
                    Image(systemName: "1.circle").id(1).transition(.opacity)
                    Image(systemName: "2.circle").id(2).transition(.opacity)
                    Image(systemName: "4.circle").id(4).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "5.circle").id(5).transition(.opacity)
                    Image(systemName: "8.circle").id(8).transition(.opacity)
                } else if bubbleSortState == 10 {
                    Image(systemName: "1.circle").id(1).transition(.opacity)
                    Image(systemName: "2.circle").id(2).transition(.opacity)
                    Image(systemName: "4.circle").id(4).transition(.opacity)
                    Image(systemName: "5.circle").id(5).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "8.circle").id(8).transition(.opacity)
                } else if bubbleSortState == 11 {
                    Image(systemName: "1.circle").id(1).transition(.opacity)
                    Image(systemName: "2.circle").id(2).transition(.opacity)
                    Image(systemName: "4.circle").id(4).transition(.opacity)
                    Image(systemName: "5.circle").id(5).transition(.opacity)
                    Image(systemName: "8.circle").id(8).transition(.opacity).foregroundColor(.red)
                }
            }
            Spacer().frame(height: 20)
        }
        .font(itemFont)
        .onReceive(timer) { _ in
            withAnimation {
                if self.bubbleSortState == 11 {
                    self.bubbleSortState = 0
                } else {
                    self.bubbleSortState += 1
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    private var selectionSortAlgorithm: some View {
        VStack(alignment: .center, spacing: 5) {
            Spacer().frame(height: 20)
            Text("Selection Sort")
                .font(.title)
                .fontWeight(.bold)
            Text("Sorted List").font(.headline).foregroundColor(.green)
            Text("Current Smallest Item").font(.headline).foregroundColor(.red)
            Text("Current Item Being Compared").font(.headline).foregroundColor(.blue)
            Spacer().frame(height: 20)
            HStack {
                if selectionSortState == 0 {
                    Image(systemName: "11.circle").id(11).transition(.opacity)
                    Image(systemName: "25.circle").id(25).transition(.opacity)
                    Image(systemName: "12.circle").id(12).transition(.opacity)
                    Image(systemName: "22.circle").id(22).transition(.opacity)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 1 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity)
                    Image(systemName: "12.circle").id(12).transition(.opacity)
                    Image(systemName: "22.circle").id(22).transition(.opacity)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 2 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "12.circle").id(12).transition(.opacity)
                    Image(systemName: "22.circle").id(22).transition(.opacity)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 3 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.blue)
                    Image(systemName: "22.circle").id(22).transition(.opacity)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 4 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "22.circle").id(22).transition(.opacity)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 5 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "22.circle").id(22).transition(.opacity).foregroundColor(.blue)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 6 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.asymmetric(insertion: .opacity, removal: .slide))
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "22.circle").id(22).transition(.opacity)
                    Image(systemName: "50.circle").id(50).transition(.opacity).foregroundColor(.blue)
                } else if bubbleSortState == 7 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity)
                    Image(systemName: "22.circle").id(22).transition(.opacity)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 8 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "22.circle").id(22).transition(.opacity)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 9 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "22.circle").id(22).transition(.opacity).foregroundColor(.blue)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 10 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity)
                    Image(systemName: "22.circle").id(22).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 11 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.asymmetric(insertion: .opacity, removal: .slide))
                    Image(systemName: "22.circle").id(22).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "50.circle").id(50).transition(.opacity).foregroundColor(.blue)
                } else if bubbleSortState == 12 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "22.circle").id(22).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 13 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "22.circle").id(22).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "50.circle").id(50).transition(.opacity)
                } else if bubbleSortState == 14 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "22.circle").id(22).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity).foregroundColor(.red)
                    Image(systemName: "50.circle").id(50).transition(.opacity).foregroundColor(.blue)
                } else if bubbleSortState == 15 {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "22.circle").id(22).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "50.circle").id(50).transition(.opacity).foregroundColor(.green)
                } else {
                    Image(systemName: "11.circle").id(11).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "12.circle").id(12).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "22.circle").id(22).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "25.circle").id(25).transition(.opacity).foregroundColor(.green)
                    Image(systemName: "50.circle").id(50).transition(.opacity).foregroundColor(.green)
                }
            }
            Spacer().frame(height: 20)
        }
        .font(itemFont)
        .onReceive(timer) { _ in
            withAnimation {
                if self.selectionSortState == 16 {
                    self.selectionSortState = 0
                } else {
                    self.selectionSortState += 1
                }
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    
}
