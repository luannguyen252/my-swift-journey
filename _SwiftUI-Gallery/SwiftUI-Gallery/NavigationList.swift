//
//  NavigationList.swift
//  SwiftUI-Gallery
//
//  Created by Luan Nguyen on 16/01/2021.
//

import SwiftUI

struct NavigationList: View {
    var items = ["Item 1", "Item 2", "Item 3"]
    
    var body: some View {
        NavigationView {
            List(items, id:\.self) { item in
                NavigationLink(destination: Text("Detail")) {
                    HStack {
                        Image(systemName: "gift")
                            .foregroundColor(.green)
                        VStack {
                            Text(item)
                                .font(.headline)
                            Text("Subtitle")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Navigation View"))
        }
    }
}

struct NavigationList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationList()
    }
}
