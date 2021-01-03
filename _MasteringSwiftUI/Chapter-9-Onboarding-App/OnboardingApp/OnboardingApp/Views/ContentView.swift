//
//  ContentView.swift
//  OnboardingApp
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State var selectedTab: Tab = .meditating
    
    // Fix adjusting the color scheme of the indicator
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .orange
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.gray.withAlphaComponent(0.5)
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                TabView(selection: $selectedTab) {
                    ForEach(subViewData) { entry in
                        SubView(subViewModel: entry)
                            .tag(entry.tag)
                            .tabItem {
                                Text("More")
                                Image(systemName: "dot")
                            }
                    }
                } //: TAB VIEW
                .tabViewStyle(PageTabViewStyle())
                .navigationTitle("Calmify")
                
                // Navigation Button
                NavigatorView(selectedTab: $selectedTab)
            }
        }
    }
}

// MARK: - PREVIEW
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // 1. Light Mode
            ContentView()
                .preferredColorScheme(.light)
            
            // 2. Dark Mode
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
#endif
