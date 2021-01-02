//
//  MainView.swift
//  Project4 WatchKit Extension
//
//  Created by Paul Hudson on 07/10/2020.
//

import SwiftUI

struct MainView: View {
    // MARK: - BODY
    var body: some View {
        TabView {
            ContentView()
            CurrenciesView()
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
