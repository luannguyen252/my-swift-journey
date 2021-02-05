//
//  TodayView.swift
//  AppStoreToday
//
//  Created by Arifin Firdaus on 06/10/20.
//  Copyright © 2020 Arifin Firdaus. All rights reserved.
//

import SwiftUI

public struct TodayView: View {
    
    public init() { }
    
    public var body: some View {
        NavigationView {
            Text("TodayView")
                .navigationBarTitle("Today")
        }
    }
}

struct TodayView_Previews: PreviewProvider {
    static var previews: some View {
        TodayView()
    }
}
