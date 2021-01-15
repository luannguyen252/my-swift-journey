//
//  TabBarView.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import SwiftUI

struct TabBarView: View {
    private let context = CoreDataManager.shared.managedObjectContext
    
    var body: some View {
        TabView {
            GlobalDataView()
                .environment(\.managedObjectContext, context)
                .tabItem {
                    VStack {
                        Image(systemName: "waveform.path.ecg")
                            .font(.system(size: 22))
                        Text(verbatim: "Statistic")
                    }
                }
            
            MapContainerView()
                .environment(\.managedObjectContext, context)
                .tabItem {
                    VStack {
                        Image(systemName: "map.fill")
                            .font(.system(size: 22))
                        Text(verbatim: "Map")
                    }
                }
            CovidFAQView()
                .tabItem {
                    VStack {
                        Image(systemName: "info.circle")
                            .font(.system(size: 22))
                        Text(verbatim: "Info")
                    }
                }
        }
        .accentColor(.red)
    }
}
