//
//  GeometryReaderExample.swift
//  ViewLayoutExample
//
//  Created by kim sunchul on 2020/05/01.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

//GeometryReade는 사용가능한 넓이와 높이를 알려주는 입력 값을 제공하고, 계산이 필요할때마다 사용할 수 있습니다

struct GeometryReaderExample: View {
    @State var dragAmount = CGSize.zero

    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing:0) {
//                ForEach(1..<10) { num in
//                    VStack {
//                        GeometryReader { geo in
//                            Text("Number \(num)")
//                                .font(.largeTitle)
//                                .padding()
//                                .background(Color.red)
//                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX)), axis: (x: 0, y: 1, z: 0))
//                        }
//                    }
//                    .frame(width:200)
//                }
//            }
//            .padding()
//        }
        VStack {
            GeometryReader { geo in
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .rotation3DEffect(.degrees(-Double(self.dragAmount.width) / 20), axis: (x: 0, y: 1, z: 0))
                    .rotation3DEffect(.degrees(Double(self.dragAmount.height / 20)), axis: (x: 1, y: 0, z: 0))
                    .offset(self.dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { self.dragAmount = $0.translation }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    self.dragAmount = .zero
                                }
                            }
                    )
            }
        }
        
    }
}

struct GeometryReaderExample_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderExample()
    }
}
