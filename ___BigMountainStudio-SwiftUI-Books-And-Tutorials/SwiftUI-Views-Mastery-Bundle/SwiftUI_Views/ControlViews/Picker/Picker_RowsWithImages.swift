//
//  Picker_3_00_CustomCells.swift
//  100Views
//
//  Created by Mark Moeykens on 6/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Picker_RowsWithImages : View {
    @State private var youTuberName = "Mark"
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Picker").font(.largeTitle)
            Text("Rows with Images").font(.title).foregroundColor(.gray)
            Text("Who do you want to watch today?")
                .padding(.top)
            
            Picker(selection: $youTuberName, label: Text("")) {
                Row(name: "Sean")
                Row(name: "Chris")
                Row(name: "Mark")
                Row(name: "Scott")
                Row(name: "Paul")
            }
            .padding(.horizontal)
            .background(Color("AccentColorDark"))
            .cornerRadius(15)
            .shadow(radius: 20)
            .labelsHidden()
        }
    }
}

fileprivate struct Row : View {
    var name: String
    
    var body: some View {
        return HStack {
            Image(systemName: "person.fill")
                .padding(.trailing)
                .foregroundColor(Color.red)
            Text(name)
        }
        .tag(name)
    }
}

struct Picker_RowsWithImages_Previews : PreviewProvider {
    static var previews: some View {
        Picker_RowsWithImages()
    }
}
