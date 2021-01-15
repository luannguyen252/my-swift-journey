//
//  IndexCardView.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/11.
//

import SwiftUI

struct IndexCardView: View {
    
    @GestureState var dragState: DragState = DragState.inactive
    @State var lists: [Int] = [0, -1, -2]
    @State var colors: [Color] = [.red, .blue, .green]
    @State var shapes: [ShapeView.Shape] = [.circle, .square, .triangle]
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color.red.opacity(0.2))
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                ForEach(0..<lists.count, id: \.self) { index in
                    CardView(color: colors[index],
                             index: Double(lists[index]),
                             shape: shapes[index])
                        .scaleEffect(isAbove(index) ? (dragState.isActive ? 1.2 : 1.0) : 1.0)
                        .offset(x: isAbove(index) ? dragState.translation.width * 0.5 : .zero,
                                y: isAbove(index) ? dragState.translation.height * 0.5 : .zero)
                        .gesture(gesture())
                        .animation(.spring())
                }
            }
        }
    }
    
    
    func isAbove(_ index: Int) -> Bool {
        self.lists[index] == 0
    }
    
    func f(_ list: [Int]) -> [Int] {
        var a = list
        let b = a.removeLast()
        a.insert(b, at: 0 )
        return a
    }
    
    func gesture() -> _EndedGesture<GestureStateGesture<DragGesture, DragState>> {
        return DragGesture().updating($dragState) { (value, dragInfo, _) in
            dragInfo = .active(translation: value.translation)
        }.onEnded {_ in
            self.lists = f(self.lists)
        }
    }
}

extension IndexCardView {
    enum DragState {
        case inactive
        case active(translation: CGSize)
    }
}

extension IndexCardView.DragState {
    var translation: CGSize {
        switch self {
        case .inactive: return .zero
        case .active(let t): return t
        }
    }
    
    var isActive: Bool {
        switch self {
        case .inactive: return false
        case .active: return true
        }
    }
}

#if DEBUG
struct IndexCardView_Previews: PreviewProvider {
    static var previews: some View {
        IndexCardView()
    }
}
#endif

struct CardView: View {
    
    let color: Color
    let index: Double
    let shape: ShapeView.Shape
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(color)
            ShapeView(shape: shape)
        }
        .frame(width: 250, height: 400)
        .zIndex(index)
        .rotationEffect(.init(degrees: Double.random(in: -20.0...20.0)))
    }
}


struct ShapeView: View {
    let shape: Shape
    var body: some View {
        Group {
            switch shape {
            case .circle:
                Circle()
            case .square:
                Rectangle()
            case .triangle:
                Triangle()
            }
        }
        .foregroundColor(.white)
        .frame(width: 80, height: 80)
        .offset(x: 60, y: 130)
    }
}


extension ShapeView {
    enum Shape {
        case circle
        case square
        case triangle
    }
}


struct Triangle: View {
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.addLines([
                    CGPoint(x: geometry.size.width * 0.5, y: 0),
                    CGPoint(x: 0, y: geometry.size.height),
                    CGPoint(x: geometry.size.width, y: geometry.size.width),
                ])
            }
            .debugPrint(geometry.size)
        }
    }
}
