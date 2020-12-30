//
//  NavViewSnippet2.swift
//  SwiftUICodeSnippets
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

struct NavViewSnippet2: View {
    var body: some View {
        // 1.
        NavigationView {
            Text("Placeholder")
                 .navigationBarTitle("Placeholder", displayMode: .large)
                .navigationBarItems(leading: MenuButton(),
                trailing: SettingsButton())
        }
        
        // 2.
        NavigationView {
            Text("Placeholder")
                 .navigationBarTitle("Placeholder", displayMode: .inline)
                .navigationBarItems(leading: MenuButton(),
                trailing: SettingsButton())
        }
    }
}

#if DEBUG
struct NavViewSnippet2_Previews: PreviewProvider {
    static var previews: some View {
        NavViewSnippet2()
    }
}
#endif

// MARK: - MENU BUTTON
struct MenuButton: View {
    var body: some View {
        Button(action: {
            print("Button Pressed!")
        }, label: {
            Image(systemName: "line.horizontal.3.decrease")
        })
    }
}

// MARK: - SETTINGS BUTTON
struct SettingsButton: View {
    var body: some View {
        Button(action: {
            print("Button Pressed!")
        }, label: {
            Image(systemName: "gearshape.fill")
        })
    }
}
