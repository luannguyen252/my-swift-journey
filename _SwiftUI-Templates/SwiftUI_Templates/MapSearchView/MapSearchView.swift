//
//  MapSearchView.swift
//  SwiftUI_Templates
//
//  Created by Hui, Malachi | DCMS on 2020/05/16.
//  Copyright © 2020 Hui, Malachi | DCMS. All rights reserved.
//

import SwiftUI
import MapKit
import Combine

struct MapSearchView: View {
    @ObservedObject var vm = MapSearchingViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            
            MapViewContainer(annotations: vm.annotations)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                HStack {
                    TextField("Search terms", text: $vm.searchQuery)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(Color.white)
                }
                .padding()
                
                if vm.isSearching {
                    Text("Searching...")
                }
                
            }
        }
        
    }
}

struct MapSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MapSearchView()
    }
}
