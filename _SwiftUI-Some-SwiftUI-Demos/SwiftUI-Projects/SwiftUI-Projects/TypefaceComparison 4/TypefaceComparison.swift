//
//  TypefaceComparison.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/10.
//

/**
 
 动画~
 手势~
 3D~
 
 */

import SwiftUI



/** 自定义运算符 */
extension CGSize {
    
    static func += (lhs: inout CGSize, rhs: CGSize) {
        lhs = CGSize(width: (lhs.width + rhs.width), height: (lhs.height + rhs.height))
    }
}


struct TypefaceComparison: View {
    
    @State var rotationX: Double = 0.0
    
    var body: some View {
        
        VStack {
            Spacer()
            ZStack {
                BelowTypeface(routationX: $rotationX)
                AboveTypeface(routationX: $rotationX)
            }
            .shadow(
                color: Color.black.opacity(0.3),
                radius: 8, x: 8, y: 8)
            .rotation3DEffect(
                .init(degrees: rotationX),
                axis: (x: 0, y: 1, z: 0.0))
            Spacer()
            RotateSlider(value: $rotationX)
        }
    }
}

struct TypefaceComparison_Previews: PreviewProvider {
    static var previews: some View {
        TypefaceComparison()
    }
}


fileprivate struct BelowTypeface: View {
    
    @State var dragSize = CGSize.zero
    @State var viewSize = CGSize.zero
    @Binding var routationX: Double
    
    var body: some View {
        Text("A")
            .fixedSize()
            .font(.system(size: 400))
            .foregroundColor(.red)
            .offset(x: dragSize.width + viewSize.width - CGFloat(routationX),
                    y: dragSize.height + viewSize.height)
            .animation(.linear)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.dragSize = value.translation
                    })
                    .onEnded({ value in
                        self.viewSize += self.dragSize
                        self.dragSize = .zero
                    })
            )
    }
    
}

fileprivate struct AboveTypeface: View {
    
    @GestureState var dragState = DragState.inactive
    @State var viewState = CGSize.zero
    @Binding var routationX: Double
    
    var body: some View {
        
        Text("A")
            .fixedSize()
            .font(.custom("Futura", size: 400))
            .foregroundColor(Color.blue.opacity(0.5))
            .gesture(gesture())
            .animation(.spring())
            .offset(x: dragState.translation.width + CGFloat(routationX),
                    y: 0)
    }
    
    
    func gesture() -> some Gesture {
        return DragGesture().updating($dragState) { (value, dragInfo, _) in
            dragInfo = .active(translation: value.translation)
        }
    }
}


extension AboveTypeface {
    enum DragState {
        case inactive
        case active(translation: CGSize)
    }
}

extension AboveTypeface.DragState {
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


fileprivate struct RotateSlider: View {
    
    @Binding var value: Double
    
    var body: some View {
        HStack {
            Image(systemName: "0.circle")
                .font(.system(size: 25))
            Slider(value: $value, in: 0.0...45.0, step: 1.0)
                .accentColor(.black)
                .foregroundColor(.red)
            Image(systemName: "45.circle")
                .font(.system(size: 25))
        }
        .padding(30)
        .padding(.bottom, 50)
    }
}
