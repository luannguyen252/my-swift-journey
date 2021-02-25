//
//  ListStyle_ListBackgroundColor.swift
//  SwiftUI_Views
//
//  Created by Mark Moeykens on 11/3/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct ListStyle_ListBackgroundColor: View {
    private var darkBlue = Color(hue: 0.657, saturation: 0.403, brightness: 0.225)
    
    var body: some View {
        VStack(spacing: 20) {
            Text("List").font(.largeTitle)
            Text("Background Color").foregroundColor(.gray)
            Text("You can also create a view modifier that can set a custom color for the background and all cells. You can still override individual cells with listRowBackground.")
                .frame(maxWidth: .infinity).padding()
                .background(Color.blue).foregroundColor(.white)
            List {
                Text("Line One")
                Text("Line Two")
                Text("Line Three")
                    .listRowBackground(Color.orange) // Override the custom background color
            }
            .foregroundColor(.white)
            .modifier(ListBackground(color: darkBlue)) // Apply your custom background color
            .ignoresSafeArea(edges: .bottom)
        }.font(.title)
    }
}

public struct ListBackground: ViewModifier {
    var color = Color.primary
    
    public func body(content: Content) -> some View {
        content
        .background(color)
        .onAppear {
            UITableView.appearance().backgroundColor = UIColor.clear
            // The cell background color is optional. You can exclude this if you already are setting a custom color for the cells.
            // Another option is to create a separate variable for the cell color to pass in
            UITableViewCell.appearance().backgroundColor = UIColor.clear
        }
        .onDisappear {
            // Return to default colors
            UITableView.appearance().backgroundColor = UIColor.systemBackground
            UITableViewCell.appearance().backgroundColor = UIColor.systemBackground
        }
    }
}


struct ListStyle_ListBackgroundColor_Previews: PreviewProvider {
    static var previews: some View {
        ListStyle_ListBackgroundColor()
    }
}
