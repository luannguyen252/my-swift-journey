//
//  DatePicker_YourOwnTitle.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 10/5/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct DatePicker_YourOwnTitle: View {
    @State private var nextFullMoonDate = Date()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("DatePicker").font(.largeTitle)
            Text("Remove this from book").foregroundColor(.gray)
//            Text("Even when you add your own title, you still have the problem with the date picker indenting.")
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color.yellow)
//
//            VStack(spacing: 0) {
//                Text("Date of next full moon")
//                    .font(.title)
//                DatePicker("", selection: $nextFullMoonDate,
//                           displayedComponents: .date)
//            }
//
//            Text("How can you prevent the indenting?")
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(Color.yellow)
        }.font(.title)
    }
}

struct DatePicker_YourOwnTitle_Previews: PreviewProvider {
    static var previews: some View {
        DatePicker_YourOwnTitle()
    }
}
