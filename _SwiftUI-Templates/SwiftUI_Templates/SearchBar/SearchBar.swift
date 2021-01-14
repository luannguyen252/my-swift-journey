//
//  SearchBar.swift
//  SwiftUI_Templates
//
//  Created by Hui, Malachi | DCMS on 2020/06/11.
//  Copyright © 2020 Hui, Malachi | DCMS. All rights reserved.
//

import SwiftUI

let countryNameArr = ["USA", "Japan", "China", "Thailand", "Earth"]

struct SearchBar: View {
    @State var text: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                CustomSearchBar(text: $text)
                ForEach(countryNameArr.filter {
                    self.text.isEmpty ? true : $0.lowercased().prefix(text.count).contains(text.lowercased())
                }, id: \.self) { name in
                    HStack {
                        Text(name)
                            .padding()
                        Spacer()
                    }
                }
            }.navigationBarTitle("Country List")
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
