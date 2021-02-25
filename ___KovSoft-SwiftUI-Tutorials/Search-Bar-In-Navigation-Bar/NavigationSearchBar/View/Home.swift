//
//  Home.swift
//  NavigationSearchBar
//
//  Created by Balaji on 29/11/20.
//

import SwiftUI

struct Home: View {
    // for search Bar...
    @Binding var filteredItems : [AppItem]
    
    var body: some View {
        
        // Apps List View...
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15){
                
                // Apps List...
                ForEach(filteredItems){item in
                    
                    // Card View....
                    
                    CardView(item: item)
                }
            }
            .padding()
        }
    }
}

