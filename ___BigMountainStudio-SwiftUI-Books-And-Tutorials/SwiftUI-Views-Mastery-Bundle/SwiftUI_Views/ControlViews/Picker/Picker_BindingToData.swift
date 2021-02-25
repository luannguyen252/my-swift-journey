//
//  Picker_BindingToData.swift
//  100Views
//
//  Created by Mark Moeykens on 6/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI

struct Picker_BindingToData : View {
    @State private var youTuberName = "Mark"
    var youTubers = ["Sean", "Chris", "Mark", "Scott", "Paul"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Picker").font(.largeTitle)
            Text("Binding to Data").foregroundColor(.gray)
            Text("Use a ForEach with your Picker view to populate it with data.")
                .frame(maxWidth: .infinity).padding()
                .background(Color("AccentColorDark"))
                .foregroundColor(Color.white)
            
            Text("Who do you want to watch today?")
                .padding(.bottom, 0)
            
            Picker(selection: $youTuberName, label: Text("")) {
                ForEach(youTubers, id: \.self) { name in
                    Row(name: name)
                }
            }
            .labelsHidden()
        }.font(.title)
    }
}

fileprivate struct Row : View {
    var name: String
    var body: some View {
        HStack {
            Image(systemName: "person.fill")
                .padding(.trailing)
                .foregroundColor(Color.orange)
            Text(name)
        }.tag(name)
    }
}

struct Picker_BindingToData_Previews : PreviewProvider {
    static var previews: some View {
        Picker_BindingToData()
    }
}
