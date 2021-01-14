//
//  OtherView.swift
//  SwiftUIApp
//
//  Created by 帝云科技 on 2020/10/30.
//

import SwiftUI

struct OtherView: View {
    var body: some View {
        
        Text("Hello, There")
            .onOpenURL(perform: { url in
                print("Other url: \(url)")
            })
    }
}

struct OtherView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView()
    }
}


struct ColorView: View {
    var colors = ["Red", "Green", "Yellow", "Blue", "Pink", "Purple"]
    var columns: [GridItem] =
        Array(repeating: .init(.flexible()), count: 2)
    @State var selectedColor: String? = nil
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(colors, id: \.self) { color in
                        NavigationLink(destination: ColorDetailsView(color: color),
                                       tag: color,
                                       selection: $selectedColor) {
                            Color(color)
                                .frame(height: 200)
                        }
                    }
                }
                .onContinueUserActivity("showColor") { userActivity in
                    if let color = userActivity.userInfo?["colorName"] as? String {
                        selectedColor = color
                    }
                }
                .navigationBarTitle("", displayMode: .inline)
            }
        }
    }
}


struct ColorDetailsView: View {
    var color: String
    
    var body: some View {
        Color(color)
            // ...
            .userActivity("showColor" ) { activity in
                activity.title = color
                activity.isEligibleForSearch = true
                activity.isEligibleForPrediction = true
                // ...
            }
    }
}
