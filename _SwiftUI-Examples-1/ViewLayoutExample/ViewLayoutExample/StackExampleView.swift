//
//  StackExampleView.swift
//  ViewLayoutExample
//
//  Created by kim sunchul on 2020/04/23.
//  Copyright © 2020 kim sunchul. All rights reserved.
//

import SwiftUI

struct StackExampleView: View {
    var body: some View {
        // Vertical Stack 예제
        VStack {
            Text("SwiftUI")
            Text("rocks")
             // Horizontal Stack 예제
            HStack {
                Text("SwiftUI")
                Text("rocks")
            }
            // Spacing 예제
            VStack(spacing:50) {
                Text("SwiftUI")
                Text("rocks")
            }
            // Divider 예제
            VStack() {
                Text("SwiftUI")
                Divider()
                Text("rocks")
            }
            // Stack 정렬 예제
            VStack(alignment: .leading) {
                Text("SwiftUI")
                Text("rocks")
            }
            
            // ZStack 예제
            ZStack (alignment: .leading){
                Image("all-out-donuts-thumb")
                Text("Hacking with Swift")
                    .font(.largeTitle)
                    .foregroundColor(.black)
            }
            
            // ZIndex 예제
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 50, height: 50)
                    .zIndex(1)
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 100, height: 100)
            }
        }

    }
}

struct StackExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StackExampleView()
    }
}
