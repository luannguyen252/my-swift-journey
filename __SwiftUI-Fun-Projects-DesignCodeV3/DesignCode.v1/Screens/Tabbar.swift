//
//  Tabbar.swift
//  DesignCode.v1
//
//  Created by Tee Becker on 10/30/20.
//

import SwiftUI

struct Tabbar: View {
    var body: some View {
        
        
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home") }
            
            CourseList()
                .tabItem {
                    Image(systemName: "book")
                    Text("Courses")
                }
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
    }
}
