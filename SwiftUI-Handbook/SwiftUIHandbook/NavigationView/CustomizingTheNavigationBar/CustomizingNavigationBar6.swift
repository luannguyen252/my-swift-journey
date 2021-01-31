//
//  CustomizingNavigationBar6.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

struct CustomizingNavigationBar6: View {
    // MARK: - BODY
    var body: some View {
        // 1.
        NavigationView {
            Text("SwiftUI")
            .navigationBarTitle("Navigation Title")
            .navigationBarItems(leading:
                    Button(action: { }) {
                        Image(systemName: "calendar.circle").imageScale(.large)
                    },
                trailing:
                    Button(action: { }) {
                        Text("Edit")
                    }
            )
        }
        
        // 2.
        NavigationView {
            Text("SwiftUI")
            .navigationBarTitle("Navigation Title")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: { }) {
                        Image(systemName: "calendar.circle")
                            .imageScale(.large)
                    }
                    Button(action: { }) {
                        Text("Edit")
                    }
                }
            )
        }
    }
}

// MARK: - PREVIEW
struct CustomizingNavigationBar6_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingNavigationBar6()
    }
}
