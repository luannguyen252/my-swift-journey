//
//  ContentView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @ObservedObject var menuViewModel = MenuViewModel()
    
    // MARK: - BODY
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
            } //: VSTACK
            .background(ColorConstants.appBackgroundColor)
        } //: GEOMETRY READER
        .edgesIgnoringSafeArea(.all)
        
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
