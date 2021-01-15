//
//  MapContainerView.swift
//  Covid-Tracker
//
//  Created by Алексей Воронов on 11.04.2020.
//  Copyright © 2020 Алексей Воронов. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea([.top, .leading, .trailing])
            .environment(\.managedObjectContext, managedObjectContext)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
