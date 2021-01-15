//
//  TapGestureExample.swift
//  RespondingToEvents
//
//  Created by kim sunchul on 2020/05/07.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct TapGestureExample: View {
    @State private var scale:CGFloat = 1.0
    
    var body: some View {
        VStack {
            Text("Tap me!")
                .onTapGesture {
                    print("Tapped")                    
            }
            Text("Tap me!2")
                .onTapGesture (count: 2){
                    
                    print("Tapped2")
            }
            Spacer().frame(height:10)
            
//            기본 스택에는 제스처를 추가할수없다. (물론 내부 아이템은 가능함.)
//            그래서 해당 스택에 제스처를 추가하고 싶으면 contentShape로 모양을 줘서 추가하면 된다.
            VStack {
                Image("unnamed").resizable().frame(width: 50, height: 50)
                Spacer().frame(height:50)
                Text("USS Enterprise")
            }.contentShape(Rectangle())
                .onTapGesture {
                    print("Show details for Enterprise")
            }
            
//           SwiftUI는 View에 여러가지 Gesture 추가가 가능함.
            Image("unnamed")
            .resizable()
            .frame(width: 100, height: 100)
                .scaleEffect(scale)
                .gesture(
                    TapGesture()
                        .onEnded{ _ in
                            self.scale += 0.1
                })
            Image("unnamed")
                .resizable()
                .frame(width: 100, height: 100)
            .gesture(
//                LongPressGesture(minimumDuration: 2)
//                    .onEnded { _ in
//                        print("Pressed!")
//                }
                DragGesture(minimumDistance: 50)
                    .onEnded { _ in
                        print("Dragged!")
                    }
            )
    
        }
    }
}

struct TapGestureExample_Previews: PreviewProvider {
    static var previews: some View {
        TapGestureExample()
    }
}
