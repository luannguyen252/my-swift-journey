//
//  Curve_OffsetTheViews.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 1/26/20.
//  Copyright © 2020 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Curve_OffsetTheViews: View {
    @State private var showMenus = false
    private var backgroundGradient = LinearGradient(gradient: Gradient(colors: [Color("Background4"), Color("Secondary4")]), startPoint: .top, endPoint: .bottom)
    
    var body: some View {
        ZStack {
            backgroundGradient.edgesIgnoringSafeArea(.all)
            
            TitleView()
            
            Group {
                MenuViews(showMenus: $showMenus)
                WelcomeBackView(showMenus: $showMenus)
            }
            .offset(y: 50)
        }
        .font(.title)
        .foregroundColor(Color("Foreground4"))
    }
}

struct Curve_OffsetTheViews_Previews: PreviewProvider {
    static var previews: some View {
        Curve_OffsetTheViews()
    }
}
