//
//  LegoSet.swift
//  lego
//
//  Created by Shivam Vijaywargiya on 20/07/20.
//

import SwiftUI

enum AllBlocks: CaseIterable {
    
    static var indexOffset: Int = 0
    
    
    case one,two,three,four,five,clear
    
    var view: AnyView {
        switch self {
        case .one:
            return AnyView(LegoBlock(color: Color(.systemYellow)))
        case .two:
            return AnyView(LegoBlock(color: Color(.systemBlue)))
        case .three:
            return AnyView(LegoBlock(color: Color(.systemOrange)))
        case .four:
            return AnyView(LegoBlock(color: Color(.systemRed)))
        case .five:
            return AnyView(LegoBlock(color: Color(.systemGreen)))
        default:
            return AnyView(EmptyView())
        }
    }
}

struct LegoSet: View {
    @State var allBlocks = AllBlocks.allCases
    @State var allIndices: [(CGFloat, CGFloat, Double, Bool)] = [
        (-80,40, 5, true),
        (-40,20, 3, false),
        (0,0, 1, false),
        (40,20, 2, true),
        (0,40, 4, false),
        (-40,60, 6, false)
    ]
    @State var currentIndex: Int = 4
    
    var body: some View {
        ZStack {
            ForEach(0..<allBlocks.count) { index in
                cube(index: index)
            }
        }
        .onAppear {
            withAnimation {
                rotate()
            }
        }
    }
    
    func cube(index: Int) -> some View {
        let offset = allIndices[index]
        return allBlocks[index].view
            .offset(x: offset.0, y: offset.1)
            .zIndex(offset.2)
    }
    
    func rotate() {
        let clearPosition = allIndices[5]
        
        allIndices[5] = allIndices[currentIndex]
        allIndices[currentIndex] = clearPosition
        
        currentIndex = currentIndex - 1
        
        if currentIndex == -1 {
            currentIndex = 4
        }
        
        if allIndices[currentIndex].3 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                withAnimation {
                    rotate()
                }
            }
            
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    rotate()
                }
            }
        }
    }
}

struct LegoSet_Previews: PreviewProvider {
    static var previews: some View {
        LegoSet()
    }
}
