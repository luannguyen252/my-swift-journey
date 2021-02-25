//
//  ContentView.swift
//  CaloryApp
//
//  Created by Anik on 29/6/20.
//  Copyright © 2020 a7studio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var menuViewModel = MenuViewModel()
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                if self.menuViewModel.menus[0].isSelected {
                    ArchiveView(width: geometry.size.width)
                } else if self.menuViewModel.menus[1].isSelected {
                    TodayDataView(width: geometry.size.width)
                } else {
                    AddDataView(width: geometry.size.width)
                }
                
                MenuView(width: geometry.size.width, menuViewModel: self.menuViewModel)
                Spacer(minLength: 34) // for safe space
            }.background(ColorConstants.appBackgroundColor)
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
