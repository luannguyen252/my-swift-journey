//
//  SpaceExampleView.swift
//  ViewLayoutExample
//
//  Created by kim sunchul on 2020/04/23.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct SpaceExampleView: View {
    var body: some View {
        VStack{
            //기본 패딩
            VStack {
                Text("SwiftUI")
                .padding()
                Text("rocks")
            }
            // Padding Bottom 적용
            Text("SwiftUI")
                .padding(.bottom)
            //  Padding 값 적용 및 방향 적용
            Text("SwiftUI")
            .padding(100)
            Text("SwiftUI")
                .padding(.bottom,100)
            // Spacer 예제
            VStack {
                Spacer()
                Text("Hello World")
                Spacer()
            }
            HStack {
                Text("Hello")
                Spacer()
                Text("World")
            }
            // Spacer Frame 예제 명확한 수치를 계산화 하고 싶을때.
            VStack {
                Text("First Label")
                Spacer()
                    .frame(height: 50)
                Text("Second Label")
            }
        }
    }
}

struct SpaceExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SpaceExampleView()
    }
}
